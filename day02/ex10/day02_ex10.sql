SELECT  ps2.name as person_name1 ,ps1.name as person_name2 ,ps2.address as common_adress
FROM person as ps2 join person ps1 on (ps2.id>ps1.id and ps1.address=ps2.address)
order by 1,2,3