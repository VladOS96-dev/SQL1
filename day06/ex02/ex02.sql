SELECT p.name as name, pizza_name, m.price, m.price - (m.price * pd.discount) / 100 as discount_price, p2.name as pizzeria_name
FROM person_order
         join menu m on m.id = person_order.menu_id
         join person_discounts pd on person_order.person_id = pd.person_id and m.pizzeria_id = pd.pizzeria_id
         join person p on p.id = pd.person_id
         join pizzeria p2 on p2.id = m.pizzeria_id
order by p.name, 2
