INSERT INTO contacts (first_name, last_name, number)
VALUES ('William', 'Swift', '7204890809');

INSERT INTO calls ("when", duration, contact_id)
VALUES ('2016-01-18 14:47:00', 632, 26);

UPDATE CALLS SET contact_id = 6
WHERE id = 6;

DELETE FROM contacts
WHERE id = 26;

SELECT calls."when", calls.duration, contacts.first_name FROM calls
JOIN contacts on calls.contact_id = contacts.id
WHERE contacts.id != 6;

INSERT INTO contacts (first_name, last_name, number)
VALUES ('Merve', 'Elk', 6343511126), ('Sawa', 'Fydorov', 6125594874);

INSERT INTO calls ("when", duration, contact_id)
VALUES ('2016-01-17 11:52:00', 175, 27), ('2016-01-18 21:22:00', 79, 28);

ALTER TABLE contacts
ADD CONSTRAINT unique_number UNIQUE (number);

INSERT INTO contacts (first_name, last_name, number)
VALUES ('Christie', 'Renaud', 6343511126);