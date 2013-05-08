drop procedure if exists Leaves;

delimiter $

/*
 Given some tree called 'tree', this algorithm reads some node as a parameter, then inserts all edges
 which are linked to that node or descendants of that node into a table called 'tc'.  Make sure that 'tree' follows this format: 
 (parent integer, child integer).
*/


create procedure Leaves(v integer)
begin
	declare num_new_edges integer;
	
	-- p = parent, c = child
	create table if not exists tc(p integer, c integer);
	create table if not exists tcnew(p integer, c integer);
	create table if not exists all_leaves(v integer);
	
	delete from tc;
	delete from tcnew;
	delete from all_leaves;
	
	insert into tcnew (select * from tree);
	
	select count(*) into num_new_edges from tcnew;
	
	while (num_new_edges > 0) do
		select count(*) into num_new_edges from tcnew;
		
		insert into tc(select distinct * from tcnew);
		
		delete from tcnew;
		
		-- step down the tree (increase depth)
		insert into tcnew(select tc.p, tree.c from tc, tree where tc.c = tree.p);
		
		delete from tcnew where(tcnew.p, tcnew.c) in (select * from tc);
	end while;
	
	insert into all_leaves (select distinct c from tc where (p = v or c = v) and c not in (select p from tc));
end
$

delimiter ;
