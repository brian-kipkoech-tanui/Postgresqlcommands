SELECT title
FROM films
WHERE release_year=1920
OR release_year=1930
OR release_year=1940;

-- The Same as below

SELECT title
FROM films
WHERE release_year IN (1920, 1930, 1940);