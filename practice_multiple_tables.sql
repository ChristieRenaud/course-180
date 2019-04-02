SELECT count(customers.id), count(tickets.customer_id) FROM tickets
FULL JOIN customers on customers.id = tickets.customer_id;

SELECT count(DISTINCT tickets.customer_id)/count(DISTINCT customers.id)::float * 100 as percent FROM tickets
FULL JOIN customers on customers.id = tickets.customer_id;

SELECT count(id) FROM customers;

SELECT count(DISTINCT id) FROM customers;

SELECT events.name, count(tickets.id) FROM tickets
INNER JOIN events ON events.id = tickets.event_id
GROUP BY events.name
ORDER BY count DESC;

SELECT DISTINCT tickets.customer_id, customers.id  FROM tickets
RIGHT OUTER JOIN customers on customers.id = tickets.customer_id
LIMIT 20;

SELECT customers.id, customers.email, count(DISTINCT tickets.event_id) FROM customers
JOIN tickets on customers.id = tickets.customer_id
GROUP BY customers.id
HAVING count(DISTINCT tickets.event_id) = 3;

SELECT events.name as event, events.starts_at, sections.name as section, seats.row, seats.number as seat
FROM events
  JOIN tickets on events.id = tickets.event_id
  JOIN customers  on tickets.customer_id = customers.id
  JOIN seats on tickets.seat_id = seats.id
  JOIN sections on seats.section_id = sections.id
WHERE customers.email = 'gennaro.rath@mcdermott.co';

INSERT INTO films (title, year, genre, director, duration)
VALUES  ('Wayne''s World', 1992, 'comedy', 'Penelope Spheeris', 95),
        ('Bourne Identity', 2002, 'espionage', 'Doug Liman', 118);

SELECT DISTINCT genre FROM films;

SELECT round(avg(duration)) FROM films;

SELECT genre, round(avg(duration)) FROM films
GROUP BY genre;

SELECT (year / 10) * 10 as decade, round(avg(duration)) as average_duration FROM films
GROUP BY decade
ORDER BY decade ASC;

SELECT title FROM films
WHERE director LIKE 'John%';

SELECT genre, count(id) FROM films
GROUP BY genre ORDER BY count(id) DESC;

SELECT (year / 10) * 10 as decade, genre, string_agg(title, ', ') as films FROM films
GROUP BY decade, genre ORDER BY decade;

SELECT genre, sum(duration) AS total_duration FROM films
GROUP BY genre
ORDER BY total_duration, genre;

