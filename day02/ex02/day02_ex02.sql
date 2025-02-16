select CASE WHEN person.name is null then '-' else person.name end as person_name,temp.visit_date
     ,CASE WHEN pizza.name is null then '-' else pizza.name end as pizzeria_name
from person left join (select  visit_date,person_id,pizzeria_id
from person_visits
where visit_date between '2022-01-01' and '2022-01-03') temp on person_id=person.id
FULL join  pizzeria pizza on pizza.id=temp.pizzeria_id
order by 1,2 ,3