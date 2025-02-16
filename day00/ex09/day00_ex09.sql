SELECT 
    (SELECT name FROM person WHERE id = pv.person_id) AS person_name ,
    (SELECT name FROM pizzeria WHERE id = pv.pizzeria_id) AS pizzeria_name  
FROM 
    (select person_id,pizzeria_id from person_visits where visit_date between '2022-01-07' and '2022-01-09') as pv
ORDER BY 
    person_name ASC, pizzeria_name DESC;