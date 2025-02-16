select order_date as order_date, CONCAT( person.name,'(age:',person.age,')') as person_information
from person_order
         inner JOIN person on person.id = person_order.person_id

order by order_date , person_information 