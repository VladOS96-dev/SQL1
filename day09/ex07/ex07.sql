CREATE FUNCTION func_minimum (VARIADIC arr NUMERIC[]) RETURNS NUMERIC AS $$
    DECLARE 
        min numeric;
		i numeric;
    BEGIN
        min = arr[1];
        FOREACH i IN ARRAY $1 LOOP
            IF i < min THEN 
                min = i;
            END IF;
        END LOOP;
				RETURN min;
    END;
$$ LANGUAGE plpgsql;

SELECT
    func_minimum (VARIADIC arr => ARRAY[10.0, -1.0, 5.0, 4.4]);