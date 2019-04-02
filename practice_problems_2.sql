/* 1. */
CREATE TABLE people (
  first_name varchar(255) NOT NULL,
  age integer,
  occupation varchar(255)
);

/* 2. */
INSERT INTO people (name, age, occupation)
     VALUES ('Abby', 34, 'biologist'),
            ('Mu''nisah', 26, NULL),
            ('Mirabelle', 40, 'contractor');

/* 3. */
SELECT * FROM people
 WHERE name = 'Mu''nisah';

SELECT * FROM people
 WHERE age = 26;

SELECT * FROM people
 WHERE occupation IS NULL;

/* 4. */
CREATE TABLE birds (
  name varchar(255),
  length decimal(4,1),
  wingspan decimal(4,1),
  family varchar(255),
  extinct boolean
);


/* 5. */
INSERT INTO birds (name, length, wingspan, family, extinct)
     VALUES ('Spotted Towhee', 21.6, 26.7, 'Emberizidae', false),
            ('American Robin', 25.5, 36.0, 'Turdidae', false),
            ('Greater Koa Finch', 19.0, 24.0, 'Fringillidae', true),
            ('Carolina Parakeet', 33.0, 55.8, 'Psittacidae', true),
            ('Common Kestrel', 35.5, 73.5, 'Falconidae', false);


/* 6. */
SELECT name, family FROM birds 
WHERE extinct = false
ORDER BY length DESC;

/* 7. */
SELECT round(avg(wingspan), 1), min(wingspan), max(wingspan) FROM birds;

/* 8. */
CREATE TABLE menu_items (
  item varchar(255),
  prep_time integer,
  ingredient_cost decimal(4,2),
  sales integer,
  menu_price decimal(4,2)
);

/* 9. */
INSERT INTO menu_items
     VALUES ('omelette', 10, 1.5, 182, 7.99),
            ('tacos', 5, 2.0, 254, 8.99),
            ('oatmeal', 1, 0.5, 79, 5.99);

/* 10. */
SELECT item, menu_price - ingredient_cost AS profit FROM menu_items
ORDER BY profit DESC
LIMIT 1;

/* 11. */
SELECT item, menu_price, ingredient_cost, 
       round((prep_time/60.00 * 13.00), 2) AS labor, 
       menu_price - ingredient_cost - round((prep_time/60.00 * 13.00), 2) AS profit
  FROM menu_items
  ORDER BY profit DESC;