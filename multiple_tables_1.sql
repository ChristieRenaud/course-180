SELECT count(id) FROM tickets;

SELECT count(email) FROM customers;

SELECT count(DISTINCT tickets.customer_id)/count(DISTINCT customers.id)::float * 100 AS percent FROM customers
LEFT OUTER JOIN tickets ON tickets.customer_id = customers.id;

SELECT events.name, count(tickets.id) AS tickets_sold FROM events
INNER JOIN tickets on events.id = tickets.event_id
GROUP BY events.name
ORDER BY tickets_sold DESC;

SELECT customers.id, customers.email, count(DISTINCT tickets.event_id) AS number_of_events FROM customers 
JOIN tickets on customers.id = tickets.customer_id
GROUP BY customers.id
HAVING count(DISTINCT tickets.event_id) = 3;

SELECT events.name AS event, events.starts_at, sections.name AS section, seats.row, seats.number AS seat 
  FROM tickets 
    INNER JOIN events on tickets.event_id = events.id
    INNER JOIN seats on seats.id = tickets.seat_id
    INNER JOIN customers on tickets.customer_id = customers.id
    INNER JOIN sections on seats.section_id = sections.id
WHERE customers.email = 'gennaro.rath@mcdermott.co';