insert into person_visits(
                          id, person_id, pizzeria_id, visit_date
) VALUES ((select max(person_visits.id) as new_id
           from person_visits
        )+1,(select person.id
             from person
             where name in('Irina')),(select pizzeria.id
                                      from pizzeria
                                      where name in ('Dominos')),'2022-02-24');
insert into person_visits(
                          id, person_id, pizzeria_id, visit_date
) VALUES ((select max(person_visits.id) as new_id
           from person_visits
        )+1,(select person.id
             from person
             where name in('Denis')),(select pizzeria.id
                                      from pizzeria
                                      where name in ('Dominos')),'2022-02-24')