select name
    from person
    join person_order 
        on person.id = person_order.person_id
    join menu 
        on person_order.menu_id = menu.id
where gender = 'female' and
      pizza_name = 'cheese pizza'
intersect
select name
    from person
    join person_order 
        on person.id = person_order.person_id
    join menu 
        on person_order.menu_id = menu.id
where gender = 'female' and
      pizza_name = 'pepperoni pizza'
order by 1