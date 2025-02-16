create materialized view mv_dmitriy_visits_and_eats  as
select DISTINCT pizzeria.name
    from pizzeria join menu  on pizzeria.id = menu.pizzeria_id
    join person_visits  on pizzeria.id = person_visits.pizzeria_id
    join person  on person.id = person_visits.person_id
where menu.price<800 and person_visits.visit_date='2022-01-08' and person.name in ('Dmitriy')

