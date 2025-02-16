with fem as
(select DISTINCT pizzeria.name as pizzeria_name
        from pizzeria
        join menu m2 on pizzeria.id = m2.pizzeria_id
        join person_order po on m2.id = po.menu_id
        join person p on p.id = po.person_id
where gender='female'
),

mans as
(      select DISTINCT pizzeria.name as pizzeria_name
        from pizzeria
        join menu m2 on pizzeria.id = m2.pizzeria_id
        join person_order po on m2.id = po.menu_id
        join person p on p.id = po.person_id
where gender='male'
)

(select pizzeria_name
from fem
except all
select pizzeria_name
from mans)
union all
(select pizzeria_name
from mans
except all
select pizzeria_name
from fem)
order by 1