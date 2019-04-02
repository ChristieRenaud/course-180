CREATE TABLE people (
  name varchar(255),
  age integer,
  occupation varchar(255)
);

INSERT INTO people (name, age, occupation)
VALUES  ('Abby', 34, 'biologist'),
        ('Mu''nisah', 26, NULL),
        ('Mirabelle', 40, 'contractor');

SELECT * FROM people
WHERE name = 'Mu''nisah';

SELECT * FROM people
WHERE age = 26;

SELECT * FROM people
WHERE occupation IS NULL;

SELECT * FROM people
LIMIT 1 OFFSET 1;

CREATE TABLE birds (
  name varchar(255),
  length numeric(4,1),
  wingspan numeric(4,1),
  family varchar(50),
  extinct boolean
);

INSERT INTO birds (name, length, wingspan, family, extinct)
VALUES  ('Spotted Towhee', 21.6, 26.7, 'Emberizidae', false);

INSERT INTO birds (name, length, wingspan, family, extinct)
VALUES  ('American Robin', 25.5, 36.0, 'Turdidae', false);

INSERT INTO birds (name, length, wingspan, family, extinct)
VALUES  ('Greater Koa Finch', 19.0, 24.0, 'Fringillidae', true);

INSERT INTO birds (name, length, wingspan, family, extinct)
VALUES  ('Common Kestrel', 33.5, 73.5, 'Falconidae', false);

SELECT name, family FROM birds
WHERE extinct = false
ORDER BY length DESC;

SELECT round(avg(wingspan), 1) AS average, min(wingspan) AS minimum, max(wingspan) AS maximum FROM birds;

CREATE TABLE menu_items(
  item varchar(50),
  prep_time integer,
  ingredient_cost numeric(4,2),
  sales integer,
  menu_price numeric(4,2)
);

INSERT INTO menu_items VALUES ('omelette', 10, 1.50, 182, 7.99);
INSERT INTO menu_items VALUES ('tacos', 5, 2.00, 254, 8.99);
INSERT INTO menu_items VALUES ('oatmeal', 1, 0.50, 79, 5.99);

SELECT item, (menu_price - ingredient_cost) AS profit FROM menu_items
ORDER BY profit DESC LIMIT 1;

SELECT item, menu_price, ingredient_cost, 
round((13.00 * prep_time/60), 2) AS labor, 
(menu_price - ingredient_cost) - round((13.00 * prep_time/60), 2) AS "total profit" 
FROM menu_items

ALTER TABLE orders
ADD FOREIGN KEY (product_id) REFERENCES products(id);

INSERT INTO orders (quantity, product_id)
VALUES  (10, 1),
        (25, 1),
        (15, 2);

SELECT orders.quantity, products.name FROM orders
INNER JOIN products on orders.product_id = products.id;
INSERT INTO orders (quantity) VALUES (35);

ALTER TABLE orders
ALTER COLUMN product_id SET NOT NULL;

UPDATE orders SET product_id = 3
WHERE product_id IS NULL;

INSERT INTO products (name) VALUES ('tiny bolt');

DELETE FROM orders WHERE id = 4;
INSERT INTO products (name) 
VALUES ('small bolt'), ('large bolt');
ORDER BY "total profit" DESC;

CREATE TABLE reviews (
  id serial PRIMARY KEY,
  product_id integer NOT NULL REFERENCES products (id),
  body text NOT NULL
);

INSERT INTO reviews (product_id, body)
VALUES  (1, 'a little small'),
        (1, 'very round!'),
        (2, 'could have been smaller');

SELECT books.id, books.author, string_agg(categories.name, ', ') AS categories
FROM books 
  JOIN books_categories on books.id = books_categories.book_id
  JOIN categories on categories.id = books_categories.category_id
GROUP BY books.id
ORDER BY books.id;

INSERT INTO categories (name) VALUES ('Space Exploration');
INSERT INTO categories (name) VALUES ('Cookbook');
INSERT INTO categories (name) VALUES ('South Asia');

ALTER TABLE books
ALTER COLUMN title TYPE varchar(100),
ALTER COLUMN author TYPE varchar(100);

INSERT INTO books (author, title)
VALUES ('Lynn Sherr', 'Sally Ride: America''s First Woman in Space'),
        ('Charlotte Brontë', 'Jane Eyre'),
        ('Meeru Dhalwala and Vikram Vij', 'Vij''s: Elegant and Inspired Indian Cuisine');

INSERT INTO books_categories (book_id, category_id)
VALUES  (4, 1),
        (4, 5),
        (4, 7),
        (5, 2),
        (5, 4),
        (6, 1),
        (6, 8),
        (6, 9);

ALTER TABLE books_categories
ADD UNIQUE (book_id, category_id);

SELECT categories.name, count(books.id) AS book_count, string_agg(books.title, ', ') AS book_titles
FROM books
  INNER JOIN books_categories on books.id = books_categories.book_id
  INNER JOIN categories on books_categories.category_id = categories.id
GROUP BY categories.name
ORDER BY categories.name;
