insert into person_order(
                         id, person_id, menu_id, order_date
) VALUES ((select max(person_order.id) from person_order)+1,(select person.id
             from person
             where name in('Irina')),(select menu.id
                                      from menu
                                      where pizza_name in ('sicilian pizza')),'2022-02-24');

insert into person_order(
                         id, person_id, menu_id, order_date
) VALUES ((select max(person_order.id) from person_order)+1,(select person.id
             from person
             where name in('Denis')),(select menu.id
                                      from menu
                                      where pizza_name in ('sicilian pizza')),'2022-02-24')