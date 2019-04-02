SELECT state, count(state) from people
GROUP BY state 
ORDER BY count(state) DESC
LIMIT 10;

SELECT substring(email from '\w+\..+$') AS domain, count(id) FROM people
GROUP BY domain
ORDER BY count(id) DESC;

DELETE FROM people
WHERE id = 3399;


DELETE FROM people
WHERE state = 'CA';

UPDATE people SET given_name = upper(given_name)
WHERE email LIKE '%teleworm.us';

DELETE FROM people;