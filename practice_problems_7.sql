CREATE SEQUENCE counter;

CREATE SEQUENCE counter_2 INCREMENT BY 2 START WITH 2;

ALTER TABLE films
ADD COLUMN id serial PRIMARY KEY;

ALTER TABLE films
DROP CONSTRAINT films_pkey;

INSERT INTO films (title, year, genre, director, duration)
  VALUES ('Wayne''s World', 1992, 'comedy', 'Penelope Spheeris', 95),
         ('Bourne Identity', 2002, 'espionage', 'Doung Liman', 118);

SELECT DISTINCT genre FROM films;

SELECT genre FROM films GROUP BY genre

SELECT genre, round(avg(duration)) AS "Average Duration" from FILMS
GROUP BY genre;

SELECT year / 10 * 10 as decade, round(avg(duration)) AS "Average Duration" from FILMS
GROUP BY decade ORDER BY decade;

SELECT * FROM films
WHERE director LIKE 'John %';

SELECT genre, count(id) FROM films
GROUP BY genre
ORDER BY count DESC;

SELECT year / 10 * 10 as decade, genre, string_agg(title, ', ') AS films from FILMS
GROUP BY decade, genre ORDER BY decade, genre;

SELECT genre, sum(duration) as total_duration FROM films
GROUP BY genre
ORDER BY total_duration, genre;