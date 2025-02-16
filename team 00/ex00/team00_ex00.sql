WITH RECURSIVE TSP AS (
    -- задание начального города
    SELECT 
        point1 AS start_point, --стартовый город
        point1 AS current_point, --текущий город
        ARRAY[point1] AS path, -- массив для хранение точек пути
        0 AS cost, --начальная стоимость
        1 AS path_length --количество обошедших городов
    FROM TSP_DB
    WHERE point1 = 'a'  -- задаем начальный город с которого нужно делать обход

    UNION ALL
    
    -- Рекурсия: продолжаем добавлять города в путь
    SELECT
        tsp.start_point,
        t.point2 AS current_point, 
        tsp.path || t.point2 AS path, --добавляем город в массив пути
        tsp.cost + t.cost AS cost, --прибавляем стоимость
        tsp.path_length + 1 AS path_length --увеличиваем количество городов которые обошли
    FROM TSP
    JOIN TSP_DB t ON tsp.current_point = t.point1 --объединяем таблицу городов с нашей таблицей по нахождению пути
    WHERE NOT t.point2 = ANY(tsp.path)  -- предотвращение циклов, проверяем на наличие города в массиве
)

, TSP_COMPLETE AS (
    -- Добавление возвращения в начальный город для завершения тура
    SELECT
        tsp.start_point,
        tsp.path || tsp.start_point AS path,
        tsp.cost + t.cost AS cost,
        tsp.path_length + 1 AS path_length
    FROM TSP tsp
    JOIN TSP_DB t ON tsp.current_point = t.point1
    WHERE t.point2 = tsp.start_point  -- завершение тура возвращением в начальный город
)

, MIN_COST AS (
    -- Находим минимальную стоимость среди всех полных путей
    SELECT MIN(cost) AS min_cost
    FROM TSP_COMPLETE
    WHERE path_length = (SELECT COUNT(DISTINCT point1) + 1 FROM TSP_DB)  -- проверка на количество уникальных городов + возврат в начальный город
)

-- Выбор всех путей с минимальной стоимостью
SELECT DISTINCT cost AS total_cost, path AS tour
FROM TSP_COMPLETE
WHERE path_length = (SELECT COUNT(DISTINCT point1) + 1 FROM TSP_DB)  -- проверка на количество уникальных городов + возврат в начальный город
  AND cost = (SELECT min_cost FROM MIN_COST)  -- выбираем только те пути, которые имеют минимальную стоимость
ORDER BY tour;
