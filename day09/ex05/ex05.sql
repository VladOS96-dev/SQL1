DROP FUNCTION fnc_persons_male ();

DROP FUNCTION fnc_persons_female ();

CREATE FUNCTION fnc_persons (IN pgender VARCHAR DEFAULT 'female') RETURNS TABLE (id BIGINT, NAME VARCHAR, age INTEGER, gender VARCHAR, address VARCHAR) AS $$
    SELECT id, name, age, gender, address FROM person WHERE gender = $1;
$$ LANGUAGE SQL;

SELECT
    *
FROM
    fnc_persons (pgender := 'male');

SELECT
    *
FROM
    fnc_persons ();