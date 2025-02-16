CREATE FUNCTION fnc_person_visits_and_eats_on_date (IN pperson VARCHAR DEFAULT 'Dmitriy', 
                                                    IN pprice NUMERIC DEFAULT 500, 
                                                    IN pdate date DEFAULT '2022-01-08') RETURNS TABLE (pizzeria_name VARCHAR) AS $$
    BEGIN
        RETURN QUERY 
            SELECT  p.name 
            FROM person_visits pv
            JOIN pizzeria p ON p.id = pv.pizzeria_id 
            JOIN menu ON menu.pizzeria_id = pv.pizzeria_id
            JOIN person ON person.id = pv.person_id
            WHERE (visit_date = pdate AND price < pprice AND person.name = pperson);
    END;
$$ LANGUAGE plpgsql;

SELECT
    *
FROM
    fnc_person_visits_and_eats_on_date (pprice := 800);

SELECT
    *
FROM
    fnc_person_visits_and_eats_on_date (pperson := 'Anna', pprice := 1300, pdate := '2022-01-01');