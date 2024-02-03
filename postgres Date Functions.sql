-- Returns the current date and time
SELECT now();

-- Truncates the timestamp to the start of the month
SELECT date_trunc('month', timestamp '2022-03-15 14:25:36');

-- Calculates the age of a person in years
SELECT age(date '2000-01-01', now());

-- Extracts the month from the timestamp
SELECT extract(month from timestamp '2022-03-15 14:25:36');

-- Extracts the year from the timestamp
SELECT date_part('year', timestamp '2022-03-15 14:25:36');

-- Formats the timestamp as 'YYYY-MM-DD'
SELECT to_char(timestamp '2022-03-15 14:25:36', 'YYYY-MM-DD');
