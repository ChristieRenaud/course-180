CREATE TABLE directors_films (
  id serial PRIMARY KEY,
  director_id integer REFERENCES directors (id),
  film_id integer REFERENCES films (id)
);

INSERT INTO directors_films (director_id, film_id)
VALUES (1, 1), (2, 2), (3, 3), (3, 7), (4, 4), (4, 10), (5, 5), (6, 6), 
       (7, 8), (8, 9);

ALTER TABLE films
DROP COLUMN director_id;

SELECT films.title, directors.name  
  FROM films
    INNER JOIN directors_films on (films.id = directors_films.film_id)
    INNER JOIN directors on (directors.id = directors_films.director_id)
ORDER BY films.title;

INSERT INTO films (title, year, genre, duration)
VALUES ('Fargo', 1996, 'comedy', 98),
       ('No Country for Old Men', 2007, 'western', 98),
       ('Sin City', 2005, 'crime', 124),
       ('Spy Kids', 2001, 'scifi', 88);

INSERT INTO directors (name) VALUES ('Joel Coen'), ('Ethan Coen'), ('Frank Miller'), ('Robert Rodriguez');

INSERT INTO directors_films (film_id, director_id)
VALUES (11, 9), 
       (12, 9), (12, 10),
       (13, 11), (13, 12), 
       (14, 12);

SELECT directors.name AS director, count(directors_films.film_id) AS films
  FROM directors
    INNER JOIN directors_films on (directors.id = directors_films.director_id)
  GROUP BY directors.name ORDER BY films DESC, directors.name ASC;
