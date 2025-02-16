create sequence seq_person_discounts start 1
    increment by 1
    minvalue 1;

select setval('seq_person_discounts', coalesce((select max(id) from person_discounts), 1), true);

alter table person_discounts
    alter column id set default nextval('seq_person_discounts');

insert into person_discounts (person_id, pizzeria_id, discount)
values (9, 4, 54)
on conflict (person_id, pizzeria_id) do update set discount = EXCLUDED.discount;