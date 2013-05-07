delimiter $

drop procedure if exists MaxOccurrence;

/*

This procedure is used to find the elements with the maximumu
occurrences in some table t. t is assumed to be a single-column table
with the following structure:

+ ---------- + --------- + --------- + -------- + ------------ + ---------- +
| Field      | Type      | Null      | Key      | Default      | Extra      |
+ ---------- + --------- + --------- + -------- + ------------ + ---------- +
| id         | char(1)   | YES       |          |              |            |
+ ---------- + --------- + --------- + -------- + ------------ + ---------- +

The output of this procedure should be a two-column table. The first
column contains variables with maximum occurrence; and the second
column contains the corresponding ocurrence count.

*/


-- IMPORTANT!! to find the elements with the max # of occurences, run the following query:
-- select * from maxes;

-- also, I copied a couple lines from the mysql online reference manual related to: 
-- 'declare continue handler for not found set done = true'
create procedure MaxOccurrence()
begin
	declare done boolean default false;
	
	declare curr char(1);
	declare c1 cursor for (select * from t);
	
	declare continue handler for not found set done = true;
	
	create table if not exists totals(header char(1), total int);
	create table if not exists maxes(frequentElement char(1));
	
	delete from totals;
	delete from maxes;

	open c1;
	
	the_loop: LOOP	
		fetch c1 into curr;
		
		if done then LEAVE the_loop;
		end if;

		if curr in (select header from totals) then update totals 
			 set total = total + 1
			 where header = curr;
		else insert into totals values(curr,1);
		end if;
	end LOOP the_loop;
	
	close c1;
	
	insert into maxes(select header from totals where total = (select max(total) from totals));
end
$

delimiter ;