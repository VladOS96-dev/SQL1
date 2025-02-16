
with fem as
(select pizzeria.name as pizzeria_name
        from person
        left join person_visits
        on person.id = person_visits.person_id
        left join pizzeria
        on person_visits.pizzeria_id = pizzeria .id
        where person.gender = 'female'
),

mans as
(       select pizzeria.name as pizzeria_name
        from person
        left join person_visits
        on person.id = person_visits.person_id
        left join pizzeria
        on person_visits.pizzeria_id = pizzeria .id
        where person.gender = 'male'
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