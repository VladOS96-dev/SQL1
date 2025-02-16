-- Session 1
begin;
update pizzeria set rating = 4.7 where id = 1;
update pizzeria set rating = 3.7 where id = 2;
commit;

-- Session 2
begin;
update pizzeria set rating = 3.9 where id = 2;
update pizzeria set rating = 2.8 where id = 1;
commit;
