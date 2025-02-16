select person.address,p.name,count(m.pizzeria_id) as count_of_orders
from person
join person_order po on person.id = po.person_id
join menu m on m.id = po.menu_id
join pizzeria p on p.id = m.pizzeria_id
group by p.name,address
order by address,2

