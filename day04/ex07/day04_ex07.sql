insert into person_visits(
                          id, person_id, pizzeria_id, visit_date

)values ((select max(person_visits.id)+1
     from person_visits),           (select person.id
                                    from person
                                    where name in('Dmitriy'))
                               , (select pizzeria.id
                                    from pizzeria
                                    where pizzeria.name in(
                                        'DoDo Pizza'
                                        )),'2022-01-08'
        );

refresh materialized view mv_dmitriy_visits_and_eats