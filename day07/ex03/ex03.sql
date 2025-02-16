select v.name                                      as name,
       coalesce(v.count, 0) + coalesce(o.count, 0) as total_count
from (select p.name             as name,
             count(pizzeria_id) as count
      from person_visits as pv
               join pizzeria as p on p.id = pv.pizzeria_id
      group by p.name) as v

         full join

     (select p.name             as name,
             count(pizzeria_id) as count
      from person_order as po
               join menu as m on m.id = po.menu_id
               join pizzeria as p on p.id = m.pizzeria_id
      group by p.name) as o
     on v.name = o.name
order by total_count desc, name