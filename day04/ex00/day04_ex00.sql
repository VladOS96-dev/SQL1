CREATE VIEW v_persons_female AS
SELECT 
    id,
    name,
    address,
    gender,
    age
FROM 
    person
WHERE 
    gender = 'female';
CREATE VIEW v_persons_male AS
SELECT 
    id,
    name,
    address,
    gender,
    age
FROM 
    person
WHERE 
    gender = 'male';
