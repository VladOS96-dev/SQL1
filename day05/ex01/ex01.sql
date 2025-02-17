


-- CREATE INDEX idx_person_visits_person_id ON  person_visits USING btree(person_id);
-- CREATE INDEX idx_person_visits_pizzeria_id ON person_visits USING btree(pizzeria_id);
-- CREATE INDEX idx_menu_pizzeria_id ON menu USING btree(pizzeria_id);
-- CREATE INDEX idx_person_order_person_id ON person_order USING btree(person_id);
-- CREATE INDEX idx_person_order_menu_id ON person_order USING btree(menu_id);

-- DROP INDEX idx_person_visits_person_id;
-- DROP INDEX idx_person_visits_pizzeria_id;
-- DROP INDEX idx_menu_pizzeria_id;
-- DROP INDEX idx_person_order_person_id;
-- DROP INDEX idx_person_order_menu_id;
EXPLAIN ANALYSE SELECT pizzeria.name,m.pizza_name
from pizzeria inner join menu m on pizzeria.id = m.pizzeria_id;
SET enable_seqscan = OFF;
EXPLAIN ANALYSE SELECT pizzeria.name,m.pizza_name
from pizzeria inner join menu m on pizzeria.id = m.pizzeria_id;
