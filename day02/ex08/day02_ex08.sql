select DISTINCT name
    from person
    join person_order  on person.id = person_order.person_id
    join menu  on person_order.menu_id = menu.id
    where gender in('male') and address in ('Moscow','Samara') and pizza_name in ('pepperoni pizza','mushroom pizza')
order by 1 desc
