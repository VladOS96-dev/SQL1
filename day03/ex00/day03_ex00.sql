select DISTINCT pizza_name,price,pizzeria.name as pizzeria_name,visit_date
    from pizzeria join menu m on pizzeria.id = m.pizzeria_id
    join person_visits pv on pizzeria.id = pv.pizzeria_id
    join person p on p.id = pv.person_id
where price between 800 and 1000 and p.name in ('Kate')
order by 1,2,3