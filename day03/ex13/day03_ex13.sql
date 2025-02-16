DELETE FROM person_order
WHERE menu_id IN (
    SELECT id
    FROM menu
    WHERE pizza_name = 'greek pizza'
) 
AND person_order.order_date > '2022-01-10';


DELETE FROM menu
WHERE pizza_name = 'greek pizza';