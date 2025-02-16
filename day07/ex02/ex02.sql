(select p.name             as name,
        count(pizzeria_id) as count,
        'visit'            as action_type
 from person_visits as pv
          join pizzeria as p on p.id = pv.pizzeria_id
 group by p.name
 order by count desc
 limit 3)

union

(select p.name             as name,
        count(pizzeria_id) as count,
        'order'            as action_type
 from person_order as po
          join menu as m on m.id = po.menu_id
          join pizzeria as p on p.id = m.pizzeria_id
 group by p.name
 order by count desc
 limit 3)
order by action_type, count desc