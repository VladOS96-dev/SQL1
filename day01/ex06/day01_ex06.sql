select order_date as action_date, person.name as person_name
from person_order
         JOIN person on person.id = person_order.person_id
INTERSECT
select visit_date, person.name
from person_visits
         JOIN person on person_id = person.id
order by action_date asc, person_name desc