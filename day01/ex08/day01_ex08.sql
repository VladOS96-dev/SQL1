select order_date as order_date, CONCAT(name,'(age:',age,')') as person_information
from person_order
NATURAL JOIN (select person.id as person_id , name, age from person)

order by order_date , person_information 