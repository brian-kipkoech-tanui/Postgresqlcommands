SELECT  DATE_PART('year', age(birthdate::timestamp)) AS age
FROM people;