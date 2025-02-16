select pz.name                as name,
       count(pz.id)           as count_of_orders,
       round(avg(m.price), 2) as average_price,
       max(m.price)           as max_price,
       min(m.price)           as min_price
from person_order as po
         join menu as m on po.menu_id = m.id
         join pizzeria as pz on pz.id = m.pizzeria_id
group by pz.name
order by pz.name