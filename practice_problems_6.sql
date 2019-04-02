ALTER TABLE films
ALTER COLUMN genre SET NOT NULL,
ALTER COLUMN director SET NOT NULL,
ALTER COLUMN duration SET NOT NULL;

ALTER TABLE films
ADD CONSTRAINT unique_title UNIQUE(title);

ALTER TABLE films
DROP CONSTRAINT unique_title;

ALTER TABLE films
ADD CONSTRAINT title_length CHECK (length(title) >= 1);

INSERT INTO films VALUES ('', 1977, 'scifi', 'George Lucas', 120);

ALTER TABLE films
DROP CONSTRAINT title_length;

ALTER TABLE films
ADD CONSTRAINT year_check CHECK (year BETWEEN 1900 AND 2100);

ALTER TABLE films
ADD CONSTRAINT director_name CHECK (length(director) >= 3 AND position(' ' in director) > 0);

UPDATE films SET director = 'Johnny'
WHERE title = 'Die Hard';

ALTER TABLE films
ADD CONSTRAINT rating_check CHECK (rating BETWEEN 1 AND 10);

ALTER TABLE films
DROP COLUMN rating;