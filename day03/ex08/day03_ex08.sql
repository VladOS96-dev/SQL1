insert into menu(
                 id, pizzeria_id, pizza_name, price
) VALUES (
          (select max(menu.id)
    from menu)+1,
          (select pizzeria.id
                      from pizzeria
                      where pizzeria.name in ('Dominos')),'sicilian pizza',900)
