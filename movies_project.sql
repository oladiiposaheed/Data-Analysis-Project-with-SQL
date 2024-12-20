-- Operators: AND | OR
-- Use single condition

--1. Extract all english language movies

SELECT * FROM movies
WHERE movie_lang = 'English'

--2. Extract all english Japanese movies
SELECT * FROM movies
WHERE movie_lang = 'Japanese'

--3 Using multiple conditions

--1. Extract all English language movies and age certificates to 18

SELECT * FROM movies
WHERE 
	movie_lang = 'English' AND age_certificate = '18'

--2. Extract all japanese language movies and age certificates to 18

SELECT * FROM movies
WHERE 
	movie_lang = 'Japanese' AND age_certificate = '18'

--- OR operator
####################

--1. Extract all English language movies or age certificates to 18

SELECT * FROM movies
WHERE 
	movie_lang = 'English' OR age_certificate = '18'

--2. Extract movie_language movies and age certificates where language is english or age
---	certificate is 18
	
SELECT movies.movie_lang, movies.age_certificate FROM movies
WHERE 
	movie_lang = 'English' OR age_certificate = '18'

--3. Extract movie_name movies and age certificates where either language is english or age
---	certificate is grater than 18
	
SELECT movies.movie_name, movies.age_certificate FROM movies
WHERE 
	movie_lang = 'English' OR age_certificate > '18'

--2. Extract all japanese language movies or age certificates to 18
	--- order by language

SELECT * FROM movies
WHERE 
	movie_lang = 'Japanese' OR age_certificate = '18'
ORDER BY age_certificate 

-- Extract all English language whose director id is 12

SELECT * FROM movies
WHERE 
	movie_lang = 'English' AND director_id = '12'

-- Extract all English language whose director id is at least 10

SELECT * FROM movies
WHERE 
	movie_lang = 'English' AND director_id >= '10'


SELECT * FROM movies 
WHERE 
	(movie_lang = 'English' OR movie_lang = 'Chinese')
	 AND movies.age_certificate = '12'
ORDER BY movie_lang

-- Extract all movies whose movie length is more than 100
	
SELECT * FROM movies 
WHERE movies.movie_length >= 100
ORDER BY movie_length;

-- Extract all movies whose movie length is exactly 100
	
SELECT * FROM movies 
WHERE movies.movie_length = 100
ORDER BY movie_length;


-- Extract all movies whose movie length is exactly 100
	
SELECT * FROM movies 
WHERE movies.movie_length <= 100
ORDER BY movie_length DESC;


--- Date Data Types ---
-----------------------------

-- List all movies whose release date is greater than 2004

SELECT release_date FROM movies
	WHERE release_date > '2004-12-31'
ORDER BY release_date DESC;


--- List all movies less than english language

SELECT * FROM movies
WHERE movie_lang < 'English'
ORDER BY movie_lang DESC

	
--- List all movies greater than english language

SELECT * FROM movies
WHERE movie_lang > 'English'
ORDER BY movie_lang DESC



--- List all movies who did not speak english language

SELECT * FROM movies
WHERE movie_lang <> 'English'
ORDER BY movie_lang DESC


--- List all movies who did not speak japanese and english language

SELECT * FROM movies
WHERE movie_lang <> 'English' AND movie_lang <> 'Japanese'
ORDER BY movie_lang DESC



---- LIMIT and OFFSET ----
-- ###########################

-- Extract the top 6 biggest movies by movie length

SELECT * FROM movies
ORDER BY movie_length DESC
LIMIT 6


-- Extract the top 5 oldest directors

SELECT * FROM directors
ORDER BY directors.date_of_birth DESC
LIMIT 5

-- Extract the top 5 oldest american directors

SELECT * FROM directors
	WHERE nationality ='American'
ORDER BY directors.date_of_birth DESC
LIMIT 5


-- Extract the top 10 youngest american directors

SELECT * FROM directors
	WHERE nationality ='American'
ORDER BY directors.date_of_birth
LIMIT 10


-- Extract the female actors

SELECT * FROM actors
WHERE gender = 'F'


-- Extract the top 10 youngest female actors

SELECT * FROM actors
WHERE gender = 'F'
ORDER BY actors.date_of_birth ASC
LIMIT 10


-- Extract the top 10 oldest female actors
SELECT * FROM actors
WHERE gender = 'F'
ORDER BY actors.date_of_birth DESC
LIMIT 10

-- Get the top 10 most domestic profitable movies
	
SELECT * FROM movies_revenues
ORDER BY movies_revenues.revenues_domestic DESC NULLS LAST
LIMIT 10;


-- Get the top 10 least domestic profitable movies
	
SELECT * FROM movies_revenues
ORDER BY movies_revenues.revenues_domestic
LIMIT 10;


-- OFFSET ---

-- List 5 films starting from the fourth one ordered by movie id

SELECT * FROM movies
ORDER BY movie_id
LIMIT 5 OFFSET 4


-- List 5 films starting from the ninth one ordered by movie id

SELECT * FROM movies
ORDER BY movie_id
LIMIT 5 OFFSET 9


-- List all top 5 movies after the top 5 highest domestic profit movies

SELECT * FROM movies_revenues
ORDER BY movies_revenues.revenues_domestic DESC NULLS LAST
LIMIT 5 OFFSET 5;


---- USING FETCH ----


SELECT * FROM movies
ORDER BY movie_length DESC
FETCH FIRST 5 ROW ONLY;


SELECT * FROM movies
ORDER BY movie_length DESC
FETCH FIRST 5 ROW ONLY


SELECT * FROM actors 
WHERE gender = 'F'
ORDER BY actors.date_of_birth DESC
FETCH FIRST 7 ROW ONLY;


SELECT * FROM directors
	WHERE nationality = 'American'
ORDER BY date_of_birth DESC


SELECT * FROM directors
	WHERE nationality = 'American'
ORDER BY date_of_birth DESC
FETCH FIRST 10 ROW ONLY
OFFSET 5;


-----  USING IN, NOT IN Operator  -----
-- ################################

-- Extract all movies for english, japanese and chinese languages

SELECT * FROM movies
WHERE 
	movie_lang IN ('English', 'Japanese', 'Chinese')
ORDER BY movie_lang DESC


-- Select all movies whose age certiicate is U 13 and PG type

SELECT * FROM movies
WHERE
		movies.age_certificate IN ('U', '12', 'PG')
ORDER BY movie_lang DESC


-- Select all movies whose age certificate is not U 13 and PG type

SELECT * FROM movies
WHERE
	movies.age_certificate NOT IN ('U', '12', 'PG')
ORDER BY movies.age_certificate DESC


-- Select all movies whose movie name is 'cold fish', 'city of God' or 'Submarine'

SELECT movie_name FROM movies
WHERE
	movie_name IN ('Jaws', 'City of God', 'Submarine')
ORDER BY movie_name DESC


-- Select all movies whose movie name is not 'cold fish', 'city of God' or 'Submarine'

SELECT movie_name FROM movies
WHERE
	movie_name NOT IN ('Jaws', 'City of God', 'Submarine')
ORDER BY movie_name DESC

-- List all actor id is 5, 2, 6 or 8
	
SELECT * FROM movies_actors
WHERE actor_id IN (5, 2, 6, 8)


-- BETWEEN and NOT BETWEEN Operators
-------------------------------------

-- value BETWEEN low and high

-- Extract all movies where released between 1991 and 2000

SELECT * FROM movies
	WHERE release_date BETWEEN '1991-01-01' AND '2000-12-31'
ORDER BY release_date

-- Extract all movies where domestic revenues are between 150 and 400
	
SELECT * FROM movies_revenues
	WHERE movies_revenues.revenues_domestic BETWEEN 150 AND 400
ORDER BY movies_revenues.revenues_domestic


-- Extract all movies where domestic revenues are between 0 and 1
	
SELECT * FROM movies_revenues
	WHERE movies_revenues.revenues_domestic BETWEEN 0 AND 1
ORDER BY movies_revenues.revenues_domestic


-- Extract all movies where domestic revenues are between 0.2 and 2
	
SELECT * FROM movies_revenues
	WHERE movies_revenues.revenues_domestic BETWEEN 0.2 AND 2
ORDER BY movies_revenues.revenues_domestic


-- Extract all movies where revenues international are between 1 and 10
	
SELECT * FROM movies_revenues
	WHERE movies_revenues.revenues_international BETWEEN 1 AND 10
ORDER BY movies_revenues.revenues_international


-- Extract all movies where revenues international are between 500 and 1000
	
SELECT * FROM movies_revenues
	WHERE movies_revenues.revenues_international BETWEEN 500 AND 1000
ORDER BY movies_revenues.revenues_international


-- Extract all movies where movie length is between 60 and 180 order by language

SELECT * FROM movies
WHERE movies.movie_length BETWEEN 60 AND 180
ORDER BY movies.movie_lang DESC


-- Extract all movies where movie length is between 60 and 180 order by movie length

SELECT * FROM movies
WHERE movies.movie_length BETWEEN 60 AND 180
ORDER BY movies.movie_length DESC


-- Extract all movies where movie length is not between 60 and 180 order by movie length

SELECT * FROM movies
WHERE movies.movie_length NOT BETWEEN 60 AND 180
ORDER BY movies.movie_length DESC


-- Extract all movies where movie length is not between 60 and 120 order by movie length

SELECT * FROM movies
WHERE movies.movie_length NOT BETWEEN 60 AND 120
ORDER BY movies.movie_length DESC


--- LIKE AND ILIKE Operators
--------------------------------------
	
1)---- Searching full character
-------------------------------
	
SELECT 'python' LIKE 'python'
	
SELECT 'python' LIKE 'Python'
	
SELECT 'django' LIKE 'd%'
	
SELECT 'django' LIKE '%d'

SELECT 'django' LIKE '%n'

SELECT 'django' LIKE '%ng'

SELECT 'django' LIKE '%ngo'

SELECT 'django' LIKE '%o'

SELECT 'django' LIKE '%o%'




---  Extract all actors names where first name starts with 'A'

SELECT * FROM actors
	WHERE actors.first_name LIKE 'A%'
ORDER BY actors.first_name


---  Extract all actors names where first_name ends with letter 'T'

SELECT * FROM actors
	WHERE actors.first_name LIKE '%t'
ORDER BY actors.first_name


---  Extract all actors names where last_name ends with letter 'T'

SELECT * FROM actors
	WHERE actors.last_name LIKE '%t'
ORDER BY actors.first_name


--- Get all the name of actors whose first name has only 6 characters

SELECT * FROM actors
	WHERE actors.first_name LIKE '______'
ORDER BY actors.first_name


-- Select all actors names where first name contains 'l' om the third place

SELECT * FROM actors
	WHERE actors.first_name LIKE '__l%'
ORDER BY actors.first_name


-- Select all actors names where last name contains 'l' om the third place

SELECT * FROM actors
	WHERE actors.last_name LIKE '__l%'
ORDER BY actors.last_name


-- Select all actors names where last name contains 't' om the third place

SELECT * FROM actors
	WHERE actors.last_name LIKE '__t%'
ORDER BY actors.last_name


-- Select all actors names that contains 'Tim'

SELECT * FROM actors
	WHERE actors.first_name LIKE '%Tim%'
ORDER BY actors.last_name


-- Select all actors names that contains 'tim'

SELECT * FROM actors
	WHERE actors.first_name LIKE '%tim%'
ORDER BY actors.last_name


-- Select all actors names that contains 'tim'

SELECT * FROM actors
	WHERE actors.first_name ILIKE '%tim%'
ORDER BY actors.last_name


--- Using IS NULL and IS NOT NULL keywords

--Extract all actors with missing birth date

SELECT * FROM actors
	WHERE actors.date_of_birth IS NULL
ORDER BY actors.date_of_birth


--Extract all actors with missing first name

SELECT * FROM actors
	WHERE actors.first_name IS NULL
ORDER BY actors.first_name


--Extract all actors with missing last name

SELECT * FROM actors
	WHERE actors.last_name IS NULL
ORDER BY actors.first_name


--Extract all actors with missing first_name  or birth_date

SELECT * FROM actors
	WHERE 
		actors.first_name IS NULL
		OR
		actors.date_of_birth IS NULL
ORDER BY actors.first_name


--Extract all actors with missing first_name and birth_date

SELECT * FROM actors
	WHERE 
		actors.first_name IS NULL
		AND
		actors.date_of_birth IS NULL
ORDER BY actors.first_name


-- Select the list of movies where domestic revenues is null

SELECT * FROM movies_revenues
	WHERE movies_revenues.revenues_domestic IS NULL
ORDER BY movies_revenues.revenues_domestic


-- Select the list of movies where international revenues is null

SELECT * FROM movies_revenues
	WHERE movies_revenues.revenues_international IS NULL
ORDER BY movies_revenues.revenues_international


-- Select the list of movies where international revenues is null

SELECT * FROM movies_revenues
	WHERE 
	movies_revenues.revenues_international IS NULL
	OR
	movies_revenues.revenues_domestic IS NULL
ORDER BY movies_revenues.revenues_international


-- Select the list of movies where international revenues domestics revenue is null

SELECT * FROM movies_revenues
	WHERE 
	movies_revenues.revenues_international IS NULL
	AND
	movies_revenues.revenues_domestic IS NULL
ORDER BY movies_revenues.revenues_international


-- Select all movies where age certificate is null

SELECT * FROM movies
	WHERE movies.age_certificate IS NULL
ORDER BY movie_length


-- Select the list of movies where international revenues domestics revenue is not null or domestic revenue is null

SELECT * FROM movies_revenues
	WHERE 
	movies_revenues.revenues_international IS NOT NULL 
	OR
	movies_revenues.revenues_domestic IS NULL
ORDER BY movies_revenues.revenues_international


----- Concatenation ------
-----------------------------

--- Merge firstname and lastname of actors as 'actor_name'

SELECT 
	CONCAT(actors.first_name, ' ', actors.last_name) AS actor_name
FROM actors
ORDER BY first_name

--- Extract first_name, last_name and date for all actors separator by comma

SELECT 
	CONCAT_WS(' | ',actors.first_name, actors.last_name, actors.date_of_birth)
FROM actors
ORDER BY actors.last_name 


-- UPPER, LOWER and INITCAP
----------------------------

-- Convert firstname and lastname of director to upper case

SELECT 
	UPPER(first_name) as first_name,
	UPPER(last_name) as last_name
FROM directors


SELECT * FROM directors


SELECT 
	INITCAP(
		CONCAT(first_name, ' ', last_name)
	)
	AS fullName
FROM directors
ORDER BY last_name

---Convert first name of directors to lower case

SELECT LOWER(first_name) FROM directors
ORDER BY first_name

---- LEFT and RIGHT

SELECT LEFT(first_name, 2) AS initial
FROM directors
ORDER BY 1


SELECT RIGHT(first_name, 2) AS initial
FROM directors
ORDER BY 1


SELECT LEFT(first_name, -2) AS initial
FROM directors
ORDER BY 1



--- Aggregation -----
--------------------------------------

--(1)-- COUNT 
----------------

--Find the total movies

SELECT COUNT(*) FROM movies


-- What is the total records for a specific column?

SELECT COUNT(movie_lang)  FROM movies


--(2)-- Using DISTINCT
--------------------------------

-- List all the movie languages from movies table

SELECT DISTINCT(movie_lang) FROM movies
ORDER BY movie_lang


--- Using COUNT with DISTINCT
--------------------------------

-- What is the total movie languages from movies table?

SELECT COUNT(DISTINCT(movies.movie_lang))
	AS total_movie_lang 
FROM movies


-- List all the movie age_certificate from movies table
SELECT DISTINCT(movies.age_certificate) FROM movies

-- What is the total movie age_certificate from movies table?
SELECT COUNT(DISTINCT(movies.age_certificate))
	AS total_age_certificate
FROM movies

-- How many movie directors from directors table
SELECT COUNT(DISTINCT(directors.director_id)) FROM directors

-- SELECT COUNT(*) from directors

-- List out all nationality of movie directors
SELECT DISTINCT(directors.nationality) FROM directors

-- Find the total nationality of movie directors

SELECT COUNT(DISTINCT(directors.nationality))
FROM directors

-- Extract all movies that speak Chinese
SELECT * FROM movies
WHERE movie_lang = 'Chinese'

-- How many movies that speak Chinese
SELECT COUNT(*) AS total_chinese_movie
FROM movies
WHERE movie_lang = 'Chinese'


-(3)-- Sum with SUM function
------------------------------------

-- What is the total movies revenues_international

SELECT SUM(movies_revenues.revenues_international) 
AS total_revenues_international 
FROM movies_revenues

-- What is the total movies domestic revenues

SELECT SUM(movies_revenues.revenues_domestic) 
AS total_revenues_domestic 
FROM movies_revenues


-- What is the total movies domestic revenues where revenues_domestic is less than 150

SELECT SUM(movies_revenues.revenues_domestic)
AS total_revenues_domestic
FROM movies_revenues
WHERE movies_revenues.revenues_domestic < 150


-- What is the total movies domestic revenues where revenues_domestic is than than 150

SELECT SUM(movies_revenues.revenues_domestic)
AS total_revenues_domestic
FROM movies_revenues
WHERE movies_revenues.revenues_domestic > 150


-- What is the total movies domestic revenues where revenues_domestic is than than 150 but less than 200

SELECT SUM(movies_revenues.revenues_domestic)
AS total_revenues_domestic
FROM movies_revenues
WHERE 
	movies_revenues.revenues_domestic > 150
	AND
	movies_revenues.revenues_domestic <= 200


-- What is the total movies revenues international where revenues_international is than than 150 but less than 200

SELECT SUM(movies_revenues.revenues_international)
AS total_revenues_international
FROM movies_revenues
WHERE 
	movies_revenues.revenues_international > 150
	AND
	movies_revenues.revenues_international <= 200

select * from movies
-- Calculate the total movie lengths that were released after 1999
SELECT SUM(movie_length)
	AS total_movie_length
FROM movies
WHERE release_date > '1999-12-31'

--OR
SELECT SUM(movie_length)
	AS total_movie_length_after_1999
FROM movies
WHERE release_date > '2000-01-01'


--- What is the total movie length of all english language movies
SELECT SUM(movie_length) AS english_movie_lang FROM movies
WHERE movies.movie_lang = 'English'


---8. Using SUM with DISTINCT
--SUM(DISTINCT expression)

SELECT SUM(DISTINCT(movies_revenues.revenues_domestic))
FROM movies_revenues

--- MIN and MAX functions ---
------------------------------

-- What is the shortest movie in the movie table

SELECT MIN(movies.movie_length) AS shortest_movie
FROM movies


-- What is the longest movie in the movie table

SELECT MAX(movies.movie_length) AS longest_movie
FROM movies

select * from movies


SELECT MAX(movie_lang) FROM movies


-- What is the longest movie for chinese language in the movie table

SELECT movies.movie_length, movie_lang FROM movies
WHERE movies.movie_lang = 'Chinese'

SELECT MAX(movies.movie_length) FROM movies
WHERE movies.movie_lang = 'Chinese'


-- What is the longest movie for english language in the movie table

SELECT movies.movie_length, movie_lang FROM movies
WHERE movies.movie_lang = 'English'

SELECT MAX(movies.movie_length) FROM movies
WHERE movies.movie_lang = 'English'


-- What is the least movie for chinese language in the movie table

SELECT movies.movie_length, movie_lang FROM movies
WHERE movies.movie_lang = 'Chinese'

SELECT MIN(movies.movie_length) FROM movies
WHERE movies.movie_lang = 'Chinese'


-- What is the latest movie release date for movie that speak chinese language in the movie table

SELECT MAX(movies.release_date) FROM movies
WHERE movies.movie_lang = 'Chinese'


-- What is the oldest movie release date for movie that speak chinese language in the movie table

SELECT MIN(movies.release_date) FROM movies
WHERE movies.movie_lang = 'Chinese'


-- What is the oldest movie release date for movie that speak spanish language in the movie table

SELECT MIN(movies.release_date) FROM movies
WHERE movies.movie_lang = 'Spanish'


-- What is the oldest movie release date for movie that speak emglish language in the movie table

SELECT MIN(movies.release_date) FROM movies
WHERE movies.movie_lang = 'English'


-- What is the latest movie release date for movie that speak emglish language in the movie table

SELECT MAX(movies.release_date) FROM movies
WHERE movies.movie_lang = 'English'


--- What was the first movie release in japanese language

SELECT MIN(movies.release_date) FROM movies
WHERE movie_lang = 'Japanese'


-- AVG ---
-------------

-- Find the average movie length for all movies

SELECT ROUND(AVG(movies.movie_length), 2) AS avg_movie_length
FROM movies


-- Find the average movie length for all movies speaking english

SELECT ROUND(AVG(movies.movie_length), 2) AS avg_movie_length
	FROM movies
WHERE movies.movie_lang = 'English'


-- Find the average movie length for all movies speaking japanese

SELECT ROUND(AVG(movies.movie_length), 2) AS avg_movie_length
	FROM movies
WHERE movies.movie_lang = 'Japanese'


-- Find the average movie length for all movies speaking english

SELECT ROUND(AVG(DISTINCT(movies.movie_length)), 2) AS avg_movie_length
	FROM movies
WHERE movies.movie_lang = 'English'





SELECT ROUND(AVG(movies.movie_length), 2) AS avg_movie_length
	FROM movies
WHERE movies.movie_lang = 'English'


-- Find the average and total movie_length for all english speaking movies

SELECT 
	AVG(movies.movie_length) AS avg,
	SUM(movies.movie_length) AS total
FROM movies


--- Combining Columns using Mathematical operators ---

SELECT 
	movies_revenues.revenues_domestic,
	movies_revenues.revenues_international,
	(movies_revenues.revenues_domestic
					+
	movies_revenues.revenues_international)
AS total_revenue
FROM movies_revenues
ORDER BY total_revenue DESC


SELECT 
	movies_revenues.revenues_domestic,
	movies_revenues.revenues_international,
	(movies_revenues.revenues_domestic
					+
	movies_revenues.revenues_international)
AS total_revenue
FROM movies_revenues
	WHERE
	(movies_revenues.revenues_domestic + movies_revenues.revenues_international) IS NOT NULL
ORDER BY total_revenue DESC




---- Grouping Data ------
---------------------------------------------

/*

SELECT 
	column_1
	AGGREGATE_FUNCTION(column_2)
FROM TABLENAME
GROUP BY column_1

*/

--- 1. Extract all movies group by movie langguage

SELECT movies.movie_lang

FROM movies
GROUP BY movie_lang
ORDER BY movies.movie_lang


--- 2. Extract the total of all movies group by movie langguage

SELECT
	movies.movie_lang,
	COUNT(movies.movie_lang) AS count_movie_lang
FROM movies
GROUP BY movies.movie_lang
ORDER BY count_movie_lang


--- 3. Find the average movie length group by movie language

SELECT 
	movie_lang,
	AVG(movie_length) AS average_movie_length
FROM movies
GROUP BY movie_lang


--- 4. Find the average movie length group by movie language order by movie language

SELECT 
	movie_lang,
	AVG(movie_length) AS average_movie_length
FROM movies
GROUP BY movie_lang
ORDER BY movie_lang


--- 5. Find the average movie length group by movie language order by movie length

SELECT 
	movie_lang,
	AVG(movie_length) AS average_movie_length
FROM movies
GROUP BY movie_lang
ORDER BY average_movie_length


--- 6. Find the total movie length per movie language order by movie length

SELECT 
	movie_lang,
	SUM(movie_length) AS total_movie_length
FROM movies
GROUP BY movie_lang
ORDER BY total_movie_length


---- 7. Calculate the sum total movie length per age certificate

SELECT 
	age_certificate,
	SUM(movie_length) AS total_movie_length
FROM movies
GROUP BY age_certificate


--- 8. List the maximum and minimum movie length per movie language

SELECT 
	movie_lang,
	MAX(movie_length) AS max_movie_length, 
	MIN(movie_length) AS min_movie_length
FROM movies
GROUP BY movie_lang


--- 9. List the total and average movie length per movie language

SELECT 
	movie_lang,
	SUM(movie_length) AS total_movie_length, 
	ROUND(AVG(movie_length), 2) AS avg_movie_length
FROM movies
GROUP BY movie_lang
ORDER BY avg_movie_length DESC


---- 10. Find the average movie length per movie language and age certificate

SELECT 
	movie_lang,
	age_certificate,
	ROUND(AVG(movies.movie_length), 2) AS avg_movie_length
FROM movies
--WHERE age_certificate <> 'PG'
GROUP BY movie_lang, age_certificate
ORDER BY movie_lang DESC


---- 10. Find the average movie length per movie language and age certificate except 'PG' age_certificate

SELECT 
	movie_lang,
	age_certificate,
	ROUND(AVG(movies.movie_length), 2) AS avg_movie_length
FROM movies
WHERE age_certificate <> 'PG'
GROUP BY movie_lang, age_certificate
ORDER BY movie_lang DESC


-- 11. Find the average movie length group by movie language and age certificate where movie length is less than 100

SELECT 
	movie_lang,
	age_certificate,
	ROUND(AVG(movies.movie_length), 2) AS avg_movie_length
FROM movies
WHERE movie_length < 100
GROUP BY movie_lang, age_certificate
ORDER BY movie_lang DESC


-- 12. Find the average movie length per age certificate where age cetificate is 15

SELECT 
	age_certificate,
	ROUND(AVG(movies.movie_length), 2) AS avg_movie_length
FROM movies
WHERE age_certificate = '11'
GROUP BY age_certificate
ORDER BY movies.age_certificate DESC


-- 13. Find the average movie length per age certificate where age cetificate is from 11 to 25

SELECT 
	age_certificate,
	ROUND(AVG(movies.movie_length), 2) AS avg_movie_length
FROM movies
WHERE age_certificate BETWEEN '12' AND '25'
GROUP BY age_certificate
ORDER BY movies.age_certificate DESC

-- Another method

SELECT 
	age_certificate,
	ROUND(AVG(movies.movie_length), 2) AS avg_movie_length
FROM movies
WHERE age_certificate >= '12' AND age_certificate <= '25'
GROUP BY age_certificate
ORDER BY movies.age_certificate DESC


--14. How many directors are there per each nationality

SELECT 
	nationality,
	COUNT(*) AS total_director
FROM directors
GROUP BY nationality
ORDER BY 1 DESC


--- 15. Find the total sum movie length for each age certificate and movie language combination

SELECT 
	movie_lang,
	age_certificate, 
	SUM(movie_length) AS total_movie_length
FROM movies
GROUP BY age_certificate, movie_lang
ORDER BY 3 DESC


------  Using HAVING ------
-----------------------------

/*

SELECT 
	column_1,
	column_2,
	AGGREGATE_FUNCTION(column_3) e.g. SUM(column_3)
FROM TABLE_NAME
GROUP column_1, column_2
HAVING
	condition;

*/

--- 1. Find the movies languages where sum total movie length of the movies is greater than or equal to 300

SELECT 
	movie_lang,
	SUM(movie_length) AS total_movie_length
FROM movies
GROUP BY movie_lang
HAVING SUM(movie_length) >= 300
ORDER BY 2 DESC


--- 2. Find the movies languages where average movie length of the movies is the same as movie length

SELECT 
	movie_lang,
	SUM(movie_length) AS total_movie_length,
	AVG(movie_length) AS avg_movie_length
FROM movies
GROUP BY movie_lang
HAVING AVG(movie_length) = SUM(movie_length) 
ORDER BY 2 DESC


--- 3. Find the movies languages where average movie length of the movies is less than sum of the movie length

SELECT 
	movie_lang,
	ROUND(AVG(movie_length), 2) AS avg_movie_length,
	SUM(movie_length) AS total_movie_length
FROM movies
GROUP BY movie_lang
HAVING AVG(movie_length) < SUM(movie_length)


-- 4. List out all directors where their total sum movie length is greater than 180

SELECT 
	director_id,
	SUM(movie_length)
FROM movies
GROUP BY director_id
HAVING SUM(movie_length) > 180
ORDER BY 2 DESC



---- Joining Multiple Tables
------------------------------------------

/*
--- 1. INNER JOINS ----

--It is used to combine columns from one or more tables based on the value on the
--------- common cloumns between tables

-- The common columns are

---- PRIMARY KEY columns of table_1 and FOREIGN KEY column of the table_2

*/

/*

SELECT * 
	FROM table_1
JOIN table_2
ON table_1.primary_key_column = table_2.foreign_key_column


SELECT 
	table_1.column_1,
	table_2.column_1
FROM table_1
INNER JOIN table_2
ON table_1.column_1 = table_2.column_2

-- NOTE: For INNER JOINS: All common columns defined at ON must match values on both tables

-- 1. combine movies table and directors table together


*/
-------------------------

-- 1. Combine 'movies' and 'directors' tables with common id

	
SELECT *
	FROM
		movies
		JOIN directors
ON movies.director_id = directors.director_id

-- OR

SELECT *
	FROM
		movies
		JOIN directors
ON directors.director_id = movies.director_id


--- directors.director_id = movies.director_id

--- Select movie_name, movie_directors, first_name, last_name from 'movies' table and 'directors' table
	
SELECT 
	movies.movie_name,
	movies.director_id,

	directors.first_name,
	directors.last_name
FROM movies
INNER JOIN directors 
ON movies.director_id = directors.director_id


--- Using Alias method for more than one table----

--- Select movie_name, movie_directors, first_name, last_name, nationality, date_of_birth, age_certificate, movie_lang and movie_length from 'movies' table and 'directors' table
	
SELECT 
	d.first_name,
	d.last_name,
	d.nationality,
	d.date_of_birth,

	m.movie_name,
	m.movie_length,
	m.movie_lang,
	m.age_certificate

FROM movies m
INNER JOIN directors d
ON m.director_id = d.director_id


--- Filter ---

--- Select movie_name, movie_directors, first_name, last_name, nationality,
	-- date_of_birth, age_certificate, movie_lang and movie_length 
	---	from 'movies' table and 'directors' table 
	--- where movie_lang is 'Chinese'

	
SELECT 
	d.first_name,
	d.last_name,
	d.nationality,
	d.date_of_birth,

	m.movie_name,
	m.movie_length,
	m.movie_lang,
	m.age_certificate

FROM movies m
INNER JOIN directors d
ON m.director_id = d.director_id
WHERE m.movie_lang = 'Chinese'


--- Select movie_name, movie_directors, first_name, last_name, nationality,
	-- date_of_birth, age_certificate, movie_lang and movie_length 
	---	from 'movies' table and 'directors' table 
	--- where movie_lang is 'English' and age_certificate is 15	

SELECT 
	d.first_name,
	d.last_name,
	d.nationality,
	d.date_of_birth,

	m.movie_name,
	m.movie_length,
	m.movie_lang,
	m.age_certificate

FROM movies m
INNER JOIN directors d
ON m.director_id = d.director_id
WHERE m.movie_lang = 'English' AND m.age_certificate = '15'



--- Select movie_name, movie_directors, first_name, last_name, nationality,
	-- date_of_birth, age_certificate, movie_lang and movie_length 
	---	from 'movies' table and 'directors' table 
	--- where movie_lang is 'English' whose movie_length ranges from 160 to 180
	
SELECT 
	d.first_name,
	d.last_name,
	d.nationality,
	d.date_of_birth,

	m.movie_name,
	m.movie_length,
	m.movie_lang,
	m.age_certificate

FROM movies m
INNER JOIN directors d
ON m.director_id = d.director_id
WHERE 
	m.movie_lang = 'English'
	AND m.movie_length BETWEEN 160 AND 180


--- Select movie_name, movie_directors, first_name, last_name, nationality,
	-- date_of_birth, age_certificate, movie_lang and movie_length 
	---	from 'movies' table and 'directors' table 
	--- where movie_lang is 'Swedish' whose movie_length is between 60 and 200
SELECT 
	d.first_name,
	d.last_name,
	d.nationality,
	d.date_of_birth,

	m.movie_name,
	m.movie_length,
	m.movie_lang,
	m.age_certificate

FROM movies m
INNER JOIN directors d
ON m.director_id = d.director_id
WHERE 
	m.movie_lang = 'Swedish'
	AND m.movie_length BETWEEN 60 AND 200
	


---- Using tablename.* table_alias.*

SELECT 
	m.*,

	d.*
FROM movies m
INNER JOIN directors d
ON m.director_id = d.director_id


--- INNER joins with USING
-------------------------------
--- USING is used when joining tables have the SAME COLUMNs NAMES, rather than ON

--- Same column name is column_1

/*
SELECT
	table_1.column_1,
	table_2.column_1
FROM table_1
INNER JOIN table_2 USING (column_1)

*/

----- Connect 'movies' and 'directors' tables with USING keyword

SELECT 
	movies.director_id,
	directors.director_id
FROM movies 
INNER JOIN directors USING (director_id)


SELECT 
	*
FROM movies 
INNER JOIN directors USING (director_id)


SELECT 
	*
FROM movies
INNER JOIN directors
ON movies.director_id = directors.director_id

-- Combine 'movies' and 'movies_revenues'

SELECT 
	*
FROM movies
INNER JOIN movies_revenues USING (movie_id)


--- Combine 'movies', 'directors' and 'movies_revenues' together
--- NOTE:
	-- The common columns between
	---- movies -> directors: director_id
	---			   movies.director_id = directors.director_id
	
	---- movies -> movies_revenues: movie_id
	--             movies.movie_id = movies_revenues.movie_id

SELECT *
FROM movies
INNER JOIN directors USING (director_id)
INNER JOIN movies_revenues USING (movie_id)


--- INNER joins with filter data
-------------------------------------

--- Select movie_name, director_name, domestic_revenues for all japanese movies

SELECT 
	d.first_name,
	d.last_name,

	m.movie_name,
	m.movie_lang,

	mr.revenues_domestic
FROM movies m
INNER JOIN directors d USING (director_id)
INNER JOIN movies_revenues mr USING (movie_id)
WHERE m.movie_lang = 'Japanese' 
ORDER BY m.movie_name


--- Select movie_name, director_name, domestic_revenues for all english movies

SELECT 
	d.first_name,
	d.last_name,

	m.movie_name,
	m.movie_lang,

	mr.revenues_domestic
FROM movies m
INNER JOIN directors d USING (director_id)
INNER JOIN movies_revenues mr USING (movie_id)
WHERE m.movie_lang = 'English' 
ORDER BY m.movie_name


--- Select movie_name, movie_directors, first_name, last_name, nationality,
	-- date_of_birth, age_certificate, movie_lang and movie_length 
	---	from 'movies' table and 'directors' table 
	--- where movie_lang is 'English' whose revenues_domestic is more than 200
	
	
SELECT 
	d.first_name,
	d.last_name,

	m.movie_name,
	m.movie_lang,

	mr.revenues_domestic
FROM movies m
INNER JOIN directors d USING (director_id)
INNER JOIN movies_revenues mr USING (movie_id)
WHERE m.movie_lang = 'English' AND mr.revenues_domestic > 200
ORDER BY m.movie_name



--- Select movie_name, movie_directors, first_name, last_name, nationality,
	-- date_of_birth, age_certificate, movie_lang and movie_length 
	---	from 'movies' table and 'directors' table 
	--- where movie_lang is 'English' whose revenues_domestic is more than 200
	
	
SELECT 
	d.first_name,
	d.last_name,

	m.movie_name,
	m.movie_lang,

	mr.revenues_domestic,
	mr.revenues_international
FROM movies m
INNER JOIN directors d USING (director_id)
INNER JOIN movies_revenues mr USING (movie_id)
WHERE 
	m.movie_lang = 'English' 
		AND 
		mr.revenues_domestic > 300
		AND
		mr.revenues_international > 300
ORDER BY m.movie_name


-- Select movie name, director name for all portuguese, english chinese, japanese movies where

SELECT 
	m.movie_name,

	d.first_name,
	d.last_name,

	mr.revenues_domestic,
	mr.revenues_international
	
FROM movies m
INNER JOIN directors d
	ON m.director_id = d.director_id
INNER JOIN movies_revenues mr
	ON m.movie_id = mr.movie_id
WHERE 
	m.movie_lang IN ('Portuguese', 'English', 'Chinese', 'Japanese')
	AND mr.revenues_domestic > 300
ORDER BY 5 DESC


-- Select movie name, director name, movie language, total revenues for all top 5 movies

SELECT 
	m.movie_name,

	d.first_name,
	d.last_name,

	mr.revenues_domestic,
	mr.revenues_international,

	(mr.revenues_domestic + mr.revenues_international)
	AS total_revenues
	
FROM movies m
INNER JOIN directors d
	ON m.director_id = d.director_id
INNER JOIN movies_revenues mr
	ON m.movie_id = mr.movie_id
ORDER BY 6 DESC NULLS LAST
LIMIT 5



-- What are the top 10 most profitable movies between year 2004 and 2009. Print the movie name, director name, movie language and total revenues

SELECT 
	m.movie_name,
	m.movie_lang,
	m.release_date,

	d.first_name,
	d.last_name,

	mr.revenues_domestic,
	mr.revenues_international,
	(mr.revenues_domestic + mr.revenues_international)
		AS total_revenues
FROM movies m
INNER JOIN directors d
	ON m.director_id = d.director_id
INNER JOIN movies_revenues mr
	ON m.movie_id = mr.movie_id
WHERE m.release_date BETWEEN  '2005-01-01' AND '2009-12-31'
ORDER BY 7 DESC NULLS LAST
LIMIT 10



----  LEFT Joins  ----
------------------------

---> Returns query row from the LEFT table PLUS rows that match values in the joined column from the right table
--- NOTE: When a LEFT table ROW does not have any match in the RIGHT table, the result shows no value from the RIGHT table.

-- Syntax
/*

SELECT 
	table_1.column_1,
	table_2.column_1
FROM table_1
LEFT JOIN table_2 ON table_1.column_1 = table_2.column_2

*/

-- Extract all the movies with directors first name and last name, movie name

SELECT 
	
	d.first_name,
	d.last_name,

	m.movie_name
	
FROM directors d
LEFT JOIN movies m
	ON m.director_id = d.director_id


--- Add more record into the directors table
select * from directors
INSERT INTO directors
	(first_name, last_name, date_of_birth, nationality)
	VALUES
	('Paul', 'Joe', '2011-05-23', 'French')


SELECT 
	
	d.first_name,
	d.last_name,

	m.movie_name
	
FROM directors d
LEFT JOIN movies m
	ON m.director_id = d.director_id


----- Extract the swedish and chinese language

SELECT 
	
	d.first_name,
	d.last_name,

	m.movie_name,
	m.movie_lang
	
FROM directors d
LEFT JOIN movies m
	ON m.director_id = d.director_id
WHERE 
	m.movie_lang IN ('Chinese', 'Swedish')


----- Count all movies for each directors

SELECT 
	d.first_name,
	d.last_name,

	COUNT(*) AS "total_movies"
FROM directors d
LEFT JOIN movies m
	ON m.director_id = d.director_id
GROUP BY d.first_name, d.last_name
ORDER BY total_movies DESC


---  Extract all the movies with age certification for all directors where nationalities are 'chinese' and 'swedish'

SELECT 
	*
FROM directors d
LEFT JOIN movies m
	ON d.director_id = m.director_id
WHERE d.nationality IN ('Swedish', 'Chinese')


--- Find the total revenues done by each movies for each directors

SELECT 
	d.first_name,
	d.last_name,

	SUM(mr.revenues_domestic + mr.revenues_international)
	AS total_revenues
	
FROM directors d
LEFT JOIN movies m
	ON m.director_id = d.director_id
LEFT JOIN movies_revenues mr
	ON m.movie_id = mr.movie_id
GROUP BY d.first_name, d.last_name
ORDER BY 3 DESC NULLS LAST
LIMIT 5


--- RIGHT Join --
--------------------------

---> It returns every row from the RIGHT table plus rows values in the joined columns from the LEFT column

-- Note: When a RIGHT table row does not have a match in the LEFT table, the output shows no value from the LEFT table.


/*

SELECT
	table_1.column_1,
	table_2.column_2
FROM table_1
RIGHT JOIN table_2 
	ON table_1.column_1 = table_2.column_2

*/

--- Extract all the movies with firectors first name and last name, and movie name

SELECT 
	d.first_name,
	d.last_name,

	m.movie_name
FROM directors d 
RIGHT JOIN movies m
	ON d.director_id = m.director_id
ORDER BY d.first_name
	

SELECT 
	d.first_name,
	d.last_name,

	m.movie_name
FROM movies m 
RIGHT JOIN directors d
	ON m.director_id = d.director_id
ORDER BY d.first_name


SELECT 
	d.first_name,
	d.last_name,

	m.movie_name,
	m.movie_lang
FROM directors d
LEFT JOIN movies m
	ON m.director_id = d.director_id
WHERE 
	m.movie_lang IN ('English', 'Swedish', 'Japanese')
ORDER BY m.movie_name



-- Count all movies for each directors
--- NOTE: Right table is movies table
	
SELECT 
	d.first_name,
	d.last_name,
	
	COUNT(*) AS total_movies
	
FROM directors d
RIGHT JOIN movies m 
	ON m.director_id = d.director_id
GROUP BY d.first_name, d.last_name
ORDER BY total_movies DESC, d.first_name


--- Get all the total revenues by each films for each directors

SELECT 
	d.first_name,
	d.last_name,

   SUM(mr.revenues_domestic + mr.revenues_international) AS total_revenues
FROM directors d
RIGHT JOIN movies m
	ON d.director_id = m.director_id
RIGHT JOIN movies_revenues mr
	ON mr.movie_id = m.movie_id
GROUP BY d.first_name, d.last_name
HAVING SUM(mr.revenues_domestic + mr.revenues_international) > 200


----- FULL Join ----
---------------------------

/*

SELECT 
	table_1.column_1,
	table_2.column_2,
FROM table_2
FULL JOIN 
	ON table_1.column_1 = table_2.column_2

*/


--- Merge all the data from movies and directors tables using FULL JOIN

SELECT
	*
FROM movies m
FULL JOIN directors d
	ON m.director_id = d.director_id


--- Merge movies and directors tables using FULL JOIN where movie_lang is japanese and engligh only
	
SELECT *
FROM movies m
FULL JOIN directors d
	ON m.director_id = d.director_id
WHERE m.movie_lang IN ('English', 'Japanese')


-------   Joining multiple tables using JOIN -------

/*

SELECT 
	table_1.column_1
	table_2.column_2
	table_3.column_3
FROM table_1
JOIN table_2 ON table_1.column_1 = table_2.column_2
JOIN table_3 ON table_1.column_1 = table_3.column_3

*/

--- Combine movies, directors and movies_revenues using JOIN
SELECT 
	*
FROM movies m
JOIN directors d 
	ON m.director_id = d.director_id
JOIN movies_revenues mr
	ON m.movie_id = mr.movie_id

---- Combine actors and movies_actors tables with JOIN

SELECT 
	* 
FROM movies_actors ma
JOIN actors a
	ON ma.actor_id = a.actor_id


---- Combine actors movies_actors, directors, movies and movies_revenues with JOIN

SELECT 
	* 
FROM actors a
JOIN movies_actors ma
	ON a.actor_id = ma.actor_id
JOIN movies m 
	ON ma.movie_id = m.movie_id
JOIN directors d
	ON m.director_id = d.director_id
JOIN movies_revenues mr
	ON m.movie_id = mr.movie_id


---- Combine actors movies_actors, directors, movies and movies_revenues with INNER JOIN

SELECT 
	* 
FROM actors a
INNER JOIN movies_actors ma
	ON a.actor_id = ma.actor_id
INNER JOIN movies m 
	ON ma.movie_id = m.movie_id
INNER JOIN directors d
	ON m.director_id = d.director_id
INNER JOIN movies_revenues mr
	ON m.movie_id = mr.movie_id


---- Self JOIN -----
-------------------------

--- It is used to compare rows within the SAME TABLE

/*

SELECT
	column_list
FROM table_1 t1
INNER JOIN table_1 t2 
	ON t1.column  = t2.column

*/

---- Self join movies table using movie_id

SELECT 
	*
FROM movies m1
INNER JOIN movies m2
	ON m1.movie_id = m2.movie_id


---- Self join movies table using director_id

SELECT 
	*
FROM movies m1
INNER JOIN movies m2
	ON m1.director_id = m2.director_id


---- Self join directors table using director_id

SELECT 
	*
FROM directors d1
INNER JOIN directors d2
	ON d1.director_id = d2.director_id 


---- Self join movies_actors table using movie_id

SELECT 
	*
FROM movies_actors ma_1
INNER JOIN movies_actors ma_2
	ON ma_1.movie_id = ma_2.movie_id 


--- Find all the pair of movies that have the same movie length

SELECT 
	m1.movie_name,
	m2.movie_name,
	m1.movie_length,
	m1.movie_lang
FROM movies m1
INNER JOIN movies m2
	ON m1.movie_length = m2.movie_length
	AND
	m1.movie_name <> m2.movie_name
ORDER BY m1.movie_length DESC


--- Query hierarchical data like all movies and directors

SELECT * 
FROM movies
ORDER BY director_id DESC 

SELECT 
	m1.movie_name,
	m2.director_id
FROM movies m1
INNER JOIN movies m2
	ON m1.director_id = m2.director_id
--	AND m1.movie_name <> m2.movie_name
ORDER BY 2 DESC


---- CROSS Joins ---
-----------------------

--- The CROSS JOIN keyword matches ALL records from the "left" table with EACH record from the "right" table.

--- That means that all records from the "right" table will be returned for each record in the "left" table.

/*

SELECT 
	column_list
FROM table_1
CROSS JOIN table_2

*/

--- CROSS JOIN movies and movies_actors

SELECT 
	* 
FROM movies
CROSS JOIN movies_actors


SELECT 
	* 
FROM movies_actors
CROSS JOIN movies


-- Method 2

/*

SELECT *
FROM table_1, table_2

*/
SELECT 
	*
FROM movies, movies_actors

--

SELECT 
	*
FROM movies_actors, movies


--- Method 3:

/*

SELECT *
FROM table_1
INNER JOIN table_2 TRUE

*/

SELECT *
FROM movies
INNER JOIN movies_actors ON TRUE


--- CROSS join movies and directors

SELECT *
FROM movies
INNER JOIN directors ON TRUE


---- Natural Joins ---

/*

SELECT 
	column_list
FROM table_1
NATURAL [INNER, LEFT, RIGHT] JOIN table_2

*/

-- Join movies and movies_actors tble together using natural join

SELECT
	*
FROM movies
NATURAL RIGHT JOIN movies_actors


-- Join movies and directors tble together using natural join

SELECT
	*
FROM movies
NATURAL RIGHT JOIN directors









----- Combine queries sets with UNION --
------------------------------------------

    ---- UNION operator combines result sets from two or more SELECT statements into a single result

/*

SELECT 
	column_, column_2
FROM table_1
UNION
SELECT
	column_1, column_2
FROM table_2

*/




					---- Subquery ----------
================================================

Syntax
/*

Outer Query
	(Inner Query)

SELECT 
	column_list
FROM table_1

WHERE
	(
		SELECT 
			column_list
		FROM table_1
	)
*/

--- Filtering with subqueries in a WHERE Clause

---- Subqueries with WHERE Clause---

--- 1. 
------- a. Find the movies average, movie length, then
------- b. use the output from the first query and find movies that are more than average movie length

SELECT 
	AVG(movies.movie_length)
FROM movies


SELECT 
	movies.movie_name,
	movies.movie_length
FROM movies
WHERE 
	movies.movie_length >
	(
		SELECT 
			AVG(movies.movie_length)
		FROM movies
	)


--- 2. Extract first and last name of all actors who are younger than Tim Allen

SELECT
	a.first_name,
	a.last_name,
	a.date_of_birth
FROM actors a

WHERE a.date_of_birth <
	(
		SELECT 
		a.date_of_birth
		FROM actors a
		WHERE a.first_name = 'Douglas'
	)
ORDER BY a.date_of_birth


          ---- Subquery with IN operator ----

--- 2. Find all movies where domestic revenues are greater than 200

SELECT 
	movie_name,
	movie_lang
FROM movies
WHERE 
	movie_id IN
	(
		SELECT 
			movie_id
		FROM movies_revenues
		WHERE revenues_domestic > 200
)


--- Extract all movies where domestic revenue are more than international revenues

SELECT
	movie_id,
	movie_name
FROM movies
WHERE 
	movies.movie_id IN
		(
			SELECT 
				movie_id
			FROM movies_revenues
			WHERE 
				movies_revenues.revenues_domestic > movies_revenues.revenues_international
		)


------  Subquery with JOINs  ------

---- Extract all the directors where their movies made more than the average total revenue of all english movies

SELECT 
	d.director_id,
	SUM(mr.revenues_domestic + mr.revenues_international) AS total_revenue
FROM directors d
INNER JOIN movies m
	ON m.director_id = d.director_id
INNER JOIN movies_revenues mr
	ON mr.movie_id = m.movie_id
WHERE 
	(mr.revenues_domestic + mr.revenues_international) >
	(
		SELECT 
		ROUND(AVG(revenues_domestic + revenues_international), 2) AS average_revenue
		FROM movies_revenues

	)
GROUP BY d.director_id
ORDER BY 2 DESC, 1 ASC


----  Order entries in UNION without using ORDER BY -----

SELECT *
FROM
(
	SELECT first_name, 0 myorder, 'actors' AS tablename FROM actors
	UNION
	SELECT first_name, 1, 'directors' AS tablename FROM directors
) t
ORDER BY myorder


----  Subquery with an alias----

--Extract all movies record

SELECT 
	*
FROM 
(
	SELECT 
		*
	FROM movies
) t1


-----    A SELECT without a FROM    ----

SELECT
	(
		SELECT MAX(revenues_domestic) FROM movies_revenues
	),
	(
		SELECT MIN(revenues_domestic) FROM movies_revenues
	),
	(
		SELECT ROUND(AVG(revenues_domestic), 2) FROM movies_revenues
	),
	(
		SELECT SUM(revenues_domestic) FROM movies_revenues
	)


SELECT
	(
		SELECT MAX(revenues_domestic) FROM movies_revenues
	) *
	(
		SELECT MIN(revenues_domestic) FROM movies_revenues
	)


SELECT
	(
		SELECT MAX(revenues_domestic) FROM movies_revenues
	) /
	(
		SELECT MIN(revenues_domestic) FROM movies_revenues
	)
	

------  Correlated Queries ------

--- 1. List movie name, movie language and movie age certification for all movies above minimum length for each age certification

--- Parent query: List movie name, movie language and movie age certification
--- Outer query: all movies above minimum length for each age certification

SELECT 
	m1.movie_name,
	m1.movie_lang,
	m1.movie_length,
	m1.age_certificate
FROM movies m1
WHERE 
	m1.movie_length >
	(
		SELECT 
			MIN(movie_length)
		FROM movies m2
		WHERE m1.age_certificate = m2.age_certificate
	)
ORDER BY m1.movie_length 


--- 1. List movie name, movie language and movie age certification for all movies above average movie length for each age certification

--- Parent query: List movie name, movie language and movie age certification
--- Outer query: all movies above average movie length for each age certification

SELECT 
	m1.movie_name,
	m1.movie_lang,
	m1.movie_length,
	m1.age_certificate
FROM movies m1
WHERE 
	m1.movie_length >
	(
		SELECT 
			AVG(movie_length)
		FROM movies m2
		WHERE m1.age_certificate = m2.age_certificate
	)
ORDER BY m1.movie_length 


--- 3. List first name, last name and date of birth for the oldest actors for each grade

SELECT 
	a1.first_name,
	a1.last_name,
	a1.date_of_birth,
	a1.gender
FROM actors a1
WHERE 
	a1.date_of_birth  >
(
	SELECT 
		MIN(date_of_birth)
	FROM actors a2
WHERE a1.gender = a2.gender
)
ORDER BY a1.gender, a1.date_of_birth


---- USing IN in Subquery -----
----------------------------------

/*

SELECT column_list
	FROM table_name
WHERE
	column_name IN (SELECT statement)

*/










































