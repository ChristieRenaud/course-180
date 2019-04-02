CREATE TABLE temperatures (
  date date NOT NULL,
  low integer NOT NULL,
  high integer NOT NULL
);

INSERT INTO temperatures
     VALUES ('2016-03-01', 34, 43),
            ('2016-03-02', 32, 44),
            ('2016-03-03', 31, 47),
            ('2016-03-04', 33, 42),
            ('2016-03-05', 39, 46),
            ('2016-03-06', 32, 43),
            ('2016-03-07', 29, 32),
            ('2016-03-08', 23, 31),
            ('2016-03-09', 17, 28);

SELECT date, round((low + high)/2.0, 1) as average FROM temperatures
WHERE date BETWEEN '2016-3-2' AND '2016-03-08';

ALTER TABLE temperatures
ADD COLUMN rainfall integer DEFAULT 0;

UPDATE temperatures SET rainfall = (low + high)/2 - 35 
WHERE (low + high)/2 > 35;

ALTER TABLE temperatures
ALTER COLUMN rainfall TYPE numeric(6,3);
UPDATE temperatures SET rainfall = rainfall * 0.039;

ALTER TABLE temperatures
RENAME TO weather;