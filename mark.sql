delimiter $

drop procedure if exists Mark;
/*

 This procedure returns pairs (node, depth) where depth is the depth
 of the node. A tree T has the following structure in your database:

 +-------+---------+------+-----+---------+-------+
 | Field | Type    | Null | Key | Default | Extra |
 +-------+---------+------+-----+---------+-------+
 | p     | integer | YES  |     | NULL    |       |
 | c     | integer | YES  |     | NULL    |       |
 +-------+---------+------+-----+---------+-------+

 Create a table depth_marks(v integer, d integer) and save all results in it.

*/

create procedure Mark(root integer)
begin
	declare tier integer;
	declare num_children integer;
	
	create table if not exists pTree(p integer, c integer);
	create table if not exists depth_marks(node integer, nDepth integer);
	delete from pTree;
	delete from depth_marks;
	
	insert into ptree (select * from tree);
	
	
	set tier = 0;
	
	/* this should hopefully grab the root node and put it into depth_marks */	
	insert into depth_marks values(root, 0);
	
	select count(*) into num_children from pTree T, depth_marks DM where DM.node = T.p; 
	while(num_children > 0) do
		set tier = tier + 1;
		insert into depth_marks (select T.c, tier from pTree T, depth_marks DM where dm.nDepth = tier - 1 and dm.node = t.p);
		
		select count(*) into num_children from pTree T, depth_marks DM where DM.node = T.p and DM.nDepth = tier; 
	end while;
end
$

delimiter ;