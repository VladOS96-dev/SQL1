select ps.pizza_name,ps.price, pizzeria.name as pizzeria_name
from pizzeria
         join
     (select menu.id, pizza_name, price, pizzeria_id
      from menu
               left join person_order po on menu.id = po.menu_id
      where po.id is null
      order by 1) ps on ps.pizzeria_id = pizzeria.id
order by 1, 2