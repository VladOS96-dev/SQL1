create or replace function get_rate_to_usd(cur_id bigint)
returns numeric
as
$$
declare
answer numeric;
begin
select rate_to_usd
into answer
from currency
where cur_id = id
order by rate_to_usd desc
limit 1;
if (answer is not null) then
return answer;
else
return 1.0;
end if;
end;
$$ language plpgsql;

with result_table as (
select distinct COALESCE(name, 'not defined') as name
, COALESCE(lastname, 'not defined') as lastname
, sum(money) as volume
, type
, currency_id
from "user"
full join balance b on "user".id = b.user_id
group by name, lastname, type, currency_id)
, grep as (select DISTINCT currency_id, rate_to_usd, name, currency.updated
from currency
FULL join balance b2 on currency.id = b2.currency_id)

select DISTINCT result_table.name as name,
result_table.lastname as lastname,
result_table.type,
volume,
COALESCE(grep.name, 'not defined') as currency_name,
get_rate_to_usd(result_table.currency_id) as last_rate_to_usd,
volume * get_rate_to_usd(result_table.currency_id) as total_volume_in_usd
from result_table
join grep on grep.currency_id = result_table.currency_id
order by 1 desc, 2, 3;

