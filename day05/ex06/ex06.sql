create unique index idx_1 on pizzeria (rating);

set enable_seqscan = on;

explain analyse
SELECT m.pizza_name AS pizza_name,
       max(rating)
       OVER (PARTITION BY rating
           ORDER BY rating ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) AS k
FROM menu as m
         INNER JOIN pizzeria as pz ON m.pizzeria_id = pz.id
ORDER BY 1, 2;

set enable_seqscan = off;

explain analyse
SELECT m.pizza_name AS pizza_name,
       max(rating)
       OVER (PARTITION BY rating
           ORDER BY rating ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) AS k
FROM menu as m
         INNER JOIN pizzeria as pz ON m.pizzeria_id = pz.id
ORDER BY 1, 2;
