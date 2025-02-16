select person_id, count(person_id) as count_of_visit
from person_visits
group by person_id
order by count_of_visit desc, person_id;