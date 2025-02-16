
insert into person_order (id, person_id, menu_id, order_date)
select id + (select count(id) from person_order),
       id,
       (select menu.id from menu where pizza_name = 'greek pizza'),
       date(date('2022-02-16')+interval '1 day' * person.id)
from person;










