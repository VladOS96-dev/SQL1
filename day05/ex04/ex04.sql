CREATE UNIQUE INDEX idx_menu_unique ON menu (pizzeria_id, pizza_name);
set enable_seqscan = on;

explain analyze
select pizzeria_id, pizza_name
from menu;

set enable_seqscan = off;

explain analyze
select pizzeria_id, pizza_name
from menu;