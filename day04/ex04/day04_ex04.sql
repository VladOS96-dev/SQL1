create view v_symmetric_union as
    with R (person_id) as
    (select person_id from person_visits where visit_date = '2022-01-02'),
     S (person_id) as
    (select person_id from person_visits where visit_date = '2022-01-06')

    (select person_id from R
    except all
    select person_id from S)
    union all
    (select person_id from S
    except all
    select person_id from R)
order by person_id;