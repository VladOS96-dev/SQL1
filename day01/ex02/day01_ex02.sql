SELECT 
    pizza_name 
FROM 
    menu m1
WHERE 
    (SELECT COUNT(*) 
     FROM menu m2 
     WHERE m2.pizza_name = m1.pizza_name 
       AND m2.id <= m1.id) = 1

ORDER BY 
    pizza_name;