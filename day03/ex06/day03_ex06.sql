select
    m1.pizza_name,
    pz.name as pizzeria_name_1,
    g2.name as pizzeria_name_2,
    g2.price
from menu as m1
join pizzeria as pz
on m1.pizzeria_id = pz.id

cross join

(select name, pizza_name, price, pizzeria_id
from menu as m2
join pizzeria as pz2
on m2.pizzeria_id = pz2.id) as g2
where m1.pizza_name = g2.pizza_name and
      m1.price = g2.price and
      m1.pizzeria_id > g2.pizzeria_id
order by 1;