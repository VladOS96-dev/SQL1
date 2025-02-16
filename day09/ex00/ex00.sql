CREATE TABLE
    person_audit (
        created TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP NOT NULL,
        type_event CHAR(1) DEFAULT 'I' NOT NULL CONSTRAINT ch_type_event CHECK (type_event IN ('I', 'D', 'U')),
        row_id BIGINT NOT NULL,
        NAME VARCHAR,
        age INTEGER,
        gender VARCHAR,
        address VARCHAR
    );

CREATE FUNCTION fnc_trg_person_insert_audit () RETURNS TRIGGER AS $$ 
    BEGIN
        IF (TG_OP = 'INSERT' ) THEN 
            INSERT INTO person_audit SELECT current_timestamp, 'I', NEW.id, NEW.name, NEW.age, NEW.gender, NEW.address;
        END IF;
        RETURN NULL;
    END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trg_person_insert_audit
AFTER INSERT ON person FOR EACH ROW
EXECUTE FUNCTION fnc_trg_person_insert_audit ();

INSERT INTO
    person (id, NAME, age, gender, address)
VALUES
    (10, 'Damir', 22, 'male', 'Irkutsk');