
drop index idx_person_name;
CREATE INDEX idx_person_name ON person USING btree (UPPER(name));

set enable_seqscan = on;

explain analyse
select name
from person
where upper(name) is not null
order by name;

set enable_seqscan = off;

explain analyse
select name
from person
where upper(name) is not null
order by name;


-- select *
-- from pg_indexes
-- where tablename not like 'pg%';