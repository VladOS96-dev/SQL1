select order_date as action_date ,person_id
    from person_order
INTERSECT select visit_date,person_id from person_visits
order by action_date asc , person_id desc