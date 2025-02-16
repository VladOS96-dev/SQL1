WITH RECURSIVE branches AS (
    SELECT 
        ARRAY['a', point2] AS points_array, cost, 
        0 AS level 
    FROM TSP_DB 
    WHERE point1 = 'a' AND point2 != 'a'
UNION
    SELECT 
        array_append(branches.points_array, a2.point2) AS points_array, 
        branches.cost + a2.cost AS cost,
        level + 1 AS level
    FROM branches
    JOIN TSP_DB a2 ON a2.point1 = branches.points_array[array_length(branches.points_array, 1)]
    WHERE NOT a2.point2 = ANY(branches.points_array) 
      AND level < (SELECT COUNT(DISTINCT point1) - 2 
      FROM TSP_DB)
)

, TSP_COMPLETE AS (
SELECT 
        array_append(branches.points_array, 'a') AS points_array, 
        branches.cost + t.cost AS total_cost
    FROM branches
    JOIN TSP_DB t ON t.point1 = branches.points_array[array_length(branches.points_array, 1)]
    WHERE t.point2 = 'a'
      AND level = (SELECT COUNT(DISTINCT point1) - 2 FROM TSP_DB)
)
SELECT DISTINCT 
    total_cost,
    points_array AS tour_array
FROM TSP_COMPLETE
ORDER BY total_cost, tour_array ;