SELECT name
FROM pizzeria
where id not in(
            select person_visits.pizzeria_id
            from person_visits
    );

SELECT name
FROM pizzeria
where not exists(
        select person_visits.pizzeria_id
            from person_visits
    where pizzeria.id=person_visits.pizzeria_id
    );