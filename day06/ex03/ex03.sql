create unique index idx_person_discounts_unique on person_discounts (person_id, pizzeria_id);

set enable_seqscan = off;

explain analyse
select p.name                           as name,
       m.pizza_name                     as pizza_name,
       m.price                          as price,
       m.price * (1 - d.discount / 100) as discount_price
from person_order
         join menu as m on person_order.menu_id = m.id
         join person as p on person_order.person_id = p.id
         join person_discounts as d on d.person_id = p.id and d.pizzeria_id = m.pizzeria_id
order by name, pizza_name;