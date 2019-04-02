ALTER TABLE orders ADD FOREIGN KEY (product_id) REFERENCES products(id);

INSERT INTO products (name) VALUES ('small bolt'), ('large bolt');

INSERT INTO orders (product_id, quantity)
VALUES (1, 10), (1, 25), (2, 15);

SELECT orders.quantity, products.name FROM orders 
  INNER JOIN products on orders.product_id = products.id;

INSERT INTO orders (quantity)
VALUES (30);

ALTER TABLE orders 
ALTER COLUMN product_id SET NOT NULL;

DELETE FROM orders
WHERE id = 4;

CREATE TABLE reviews (
  id serial PRIMARY KEY,
  body text NOT NULL,
  product_id integer REFERENCES products (id)
);
  
INSERT INTO reviews (product_id, body)
  VALUES (1, 'a little small'),
         (1, 'very round!'),
         (2, 'could have been smaller');
