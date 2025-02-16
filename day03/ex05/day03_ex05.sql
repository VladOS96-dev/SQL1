with visit as (select distinct pizzeria.name as pizzeria_name
            from pizzeria
            join person_visits pv on pizzeria.id = pv.pizzeria_id
            join person p on p.id = pv.person_id
            where p.name in ('Andrey')
            ),
     orders as
         (select distinct pizzeria.name as pizzeria_name
        from pizzeria
        join menu m on pizzeria.id = m.pizzeria_id
        join person_order po on m.id = po.menu_id
        join person p2 on p2.id = po.person_id
        where p2.name in('Andrey')
        )

(select pizzeria_name
from visit)
except all
(select pizzeria_name
from orders)

