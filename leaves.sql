drop procedure if exists Leaves;

delimiter $

/*

 This program finds all the leaves from tree of Problem 1, and put
 them into a table named all_leaves.

*/


create procedure Leaves(v integer)
begin
	declare num_new_edges integer;
	
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
		
		insert into tcnew(select tc.p, tree.c from tc, tree where tc.c = tree.p);
		
		delete from tcnew where(tcnew.p, tcnew.c) in (select * from tc);
	end while;
	
	insert into all_leaves (select distinct c from tc where (p = v or c = v) and c not in (select p from tc));
end
$

delimiter ;
