-- # More JOIN operations tutorial - More JOIN operations with different related tables: table movie, table actor and table casting

-- # Table movie contains: id, title, yr, director, budget, gross
-- # Table actor contains: id, name
-- # Table casting contains: movieid, actorid, ord

-- 1. List the films where the yr is 1962 [Show id, title]

SELECT id, title
FROM movie
WHERE yr=1962

-- 2. Give year of 'Citizen Kane'.

SELECT yr
FROM movie
WHERE title = 'Citizen Kane'

-- 3. List all of the Star Trek movies, include the id, title and yr (all of these movies include the words Star Trek in the title). Order results by year.

SELECT id, title, yr
FROM movie
WHERE title LIKE '%Star Trek%'
ORDER BY yr

-- 4. What id number does the actor 'Glenn Close' have?

SELECT id
FROM actor
WHERE name = 'Glenn Close'

-- 5. What is the id of the film 'Casablanca'

SELECT id 
FROM movie
WHERE title = 'Casablanca'

-- 6. Obtain the cast list for 'Casablanca'.
-- Use movieid=11768, (or whatever value you got from the previous question)

SELECT (actor.name)
FROM actor JOIN casting ON (actor.id = casting.actorid) 
WHERE movieid = 11768

-- 7. Obtain the cast list for the film 'Alien'    (Join more than once: Join movie table, actor table & casting table, because we don't have the moovieid like in the previous question)

SELECT actor.name
FROM actor
JOIN casting
ON casting.actorid = actor.id
JOIN movie
ON movie.id = casting.movieid
WHERE movie.title = 'Alien'

-- 8. List the films in which 'Harrison Ford' has appeared

SELECT movie.title
FROM movie
JOIN casting
ON casting.movieid = movie.id
JOIN actor
ON actor.id = casting.actorid
WHERE actor.name = 'Harrison Ford'



