SELECT books.id, books.author, string_agg(categories.name, ', ') AS categories
  FROM books_categories
    INNER JOIN books on books.id = books_categories.book_id
    INNER JOIN categories on categories.id = books_categories.category_id
GROUP BY books.id ORDER BY books.id;

ALTER TABLE books
ALTER COLUMN title TYPE varchar(50);

INSERT INTO books (title, author) 
VALUES ('Sally Ride: America''s First Woman in Space', 'Lynn Sherr'),
       ('Jane Eyre', 'Charlotte Brontë'),
       ('Vij''s: Elegant and Inspired Indian Cuisine', 'Meeru Dhalwala and Vikram Vij');

INSERT INTO categories (name)
VALUES ('Space Exploration'), ('Cookbook'), ('South Asia');

INSERT INTO books_categories (book_id, category_id)
VALUES (4, 1), (4, 5), (4, 7),
       (5, 2), (5, 4),
       (6, 1), (6, 8), (6, 9);

ALTER TABLE books_categories
ADD UNIQUE (book_id, category_id);

SELECT categories.name, count(books.id) AS book_count, string_agg(books.title, ', ') AS book_titles 
  FROM books_categories
    INNER JOIN books on books.id = books_categories.book_id
    INNER JOIN categories on categories.id = books_categories.category_id
GROUP BY categories.name ORDER BY categories.name;