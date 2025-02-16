select person.name,count(pv.pizzeria_id) as count_of_visits
from person
join person_visits pv on person.id = pv.person_id
group by person.name
having count(pv.pizzeria_id) > 3