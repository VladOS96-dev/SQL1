CREATE FUNCTION fnc_fibonacci (pstop INTEGER DEFAULT 10) RETURNS TABLE (fibonacci INTEGER) AS $$
    WITH RECURSIVE f(a, b) AS (
        VALUES(0, 1)
        UNION ALL 
        SELECT b, a + b 
        FROM f 
        WHERE b < pstop
    ) 
    SELECT a FROM f;
$$ LANGUAGE SQL;

SELECT
    *
FROM
    fnc_fibonacci (100);

SELECT
    *
FROM
    fnc_fibonacci (20);