with  cte(missing_date) as (
	select distinct date(gs) as missing_date
    from generate_series('2022-01-01', '2022-01-10', interval '1 day') as gs
 left join
    (select DISTINCT person_visits.visit_date,person_id
from person_visits
where person_id =1 or person_id =2)
    temp   on temp.visit_date=date(gs)
where person_id is null)
select missing_date
from cte
order by 1