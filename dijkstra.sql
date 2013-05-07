delimiter $

drop procedure if exists Dijkstra;

/*

 This is an implementation of Dijkstra algorithm on some directed graph G.
 G is stored as a relational table: 

 +--------+---------+------+-----+---------+-------+
 | Field  | Type    | Null | Key | Default | Extra |
 +--------+---------+------+-----+---------+-------+
 | v1     | integer | YES  |     | NULL    |       |
 | v2     | integer | YES  |     | NULL    |       |
 | weight | double  | YES  |     | NULL    |       |
 +--------+---------+------+-----+---------+-------+
*/

create procedure Dijkstra(v0 integer)
begin
	declare num_uneval_nodes integer;
	
	create table if not exists paths(v integer, d integer);
	create table if not exists edges(v1 integer, v2 integer, weight double);
	create table if not exists library(v integer, dv integer);
	create table if not exists calculator(w integer, dw integer);
	
	delete from paths;
	delete from edges;
	delete from library;
	delete from calculator;
	
	insert into edges(select * from graph);
	
	-- S<-{v0}, D[v0]<-0
	insert into paths values (v0,0);
	
	-- for each v in V-{v0} do D[v]<-l(v0,v)
	insert into library(select e.v2, e.weight from edges e where e.v1 = v0);	
	
	select count(distinct v1) into num_uneval_nodes from edges where v1 not in (select v from paths);
	-- while S!=V do
	while(num_uneval_nodes > 0) do
		-- choose a vertex w in V-S such that D[w] is a minimum
		-- add w to S
		insert into paths(select * from library where dv = (select min(dv) from library));
		-- for each v in V-S do
			-- D[v]<-MIN(D[v],D[w]+l(w,v))

		/* calculator is used as a temporary stopping point for library, required because some of the things in library
		   are what we want, and cannot delete them quite yet */
		
		-- insert all those values not currently in the either the library or the calculator
		insert into calculator(select v2, (select max(d) from paths) + weight 
							   from edges 
							   where v2 not in (select w from calculator)
									 and v2 not in (select v from library)
									 and v2 not in (select v from paths) 
							         -- ensure that the starting vertex is the current one(w)
									 and v1 in (select v from paths where d = (select max(d) from paths)));
		-- insert the updated values
		insert into calculator(select e.v2, (select max(d) from paths) + e.weight 
							   from edges e, library l
							   -- ensure that the starting vertex is the current one(w)
							   where e.v1 in (select v from paths where d = (select max(d) from paths)) 
									 -- ensure that D[w]+l(w,v) is less than D[v]
								     and ((select max(d) from paths) + e.weight < l.dv)
									 -- ensure that the vertex is not already in the calculator
									 and e.v2 not in (select w from calculator)
									 -- (joint constraint)
									 and e.v2 = l.v);
								 
								 
		-- copy over those values already established as lower than the updated value
		insert into calculator(select * from library where v not in (select v from paths) and v not in (select w from calculator));
		
		-- reinsert the values from calculator into library, then clean up calculator
		delete from library;
		insert into library(select * from calculator);
		delete from calculator;
		
		-- for testing purposes only
		-- if (num_uneval_nodes < (select count(*) from library)) then set num_uneval_nodes=0;
		
		select count(*) into num_uneval_nodes from library;
		
		-- end if;
	end while;
end
$

delimiter ;
