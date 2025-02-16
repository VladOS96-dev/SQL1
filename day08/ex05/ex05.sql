-- Session 1
begin transaction isolation level read committed;
select sum(rating) from pizzeria;
select sum(rating) from pizzeria;
commit;
select sum(rating) from pizzeria;

-- Session 2
begin transaction isolation level read committed;
insert into pizzeria values (10, 'Kazan Pizza',5);
commit;
select sum(rating) from pizzeria;
