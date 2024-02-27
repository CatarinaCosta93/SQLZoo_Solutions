-- # SELECT from WORLD tutorial - In this tutorial we will use the SELECT command on the table world

-- # Table world contains: name, continent, area, population, gdp

-- 1. Just run the query to show the name, continent and population of all countries

SELECT name, continent, population 
FROM world 

-- 2. Show the name for the countries that have a population of at least 200 million (200 million is 200000000, there are eight zeros)
  
SELECT name 
FROM world 
WHERE population >= 200000000

-- 3. Give the name and the per capita GDP for those countries with a population of at least 200 million
-- # per capita GDP is the GDP divided by the population (gdp/population)
  
SELECT name, gdp/population 
FROM world 
WHERE population >= 200000000

-- 4. Show the name and population in millions for the countries of the continent 'South America'
-- # Divide the population by 1000000 to get population in millions
  
SELECT name, population/1000000 
FROM world 
WHERE continent = 'South America'

-- 5. Show the name and population for France, Germany and Italy
-- # IN operator

SELECT name, population 
FROM world 
WHERE name IN ('France', 'Germany', 'Italy')

-- 6. Show the countries which have a name that includes the word 'United'
-- # LIKE operator 

SELECT name 
FROM world 
WHERE name LIKE '%United%'

-- 7. Two ways to be big: A country is big if it has an area of more than 3 million sq km or it has a population of more than 250 million
-- Show the countries that are big by area or big by population
-- Show name, population and area
-- # OR operator

SELECT name, population, area 
FROM world 
WHERE area > 3000000 
OR population > 250000000

-- 8. Show the countries that are big by area (more than 3 million) or big by population (more than 250 million) but not both
-- Show name, population and area
-- # XOR operator (exclusive operator)

SELECT name, population, area 
FROM world 
WHERE area > 3000000 XOR population > 250000000

-- 9. Show the name and population in millions and the GDP in billions for the countries of the continent 'South America'
-- # Millions: Divided by 1000000 and Billions: Divided by 1000000000
-- # Use the ROUND function to show the values to two decimal places

SELECT name, ROUND(population/1000000,2), ROUND(gdp/1000000000,2) 
FROM worldW
WHERE continent = 'South America'

-- 10. Show the name and per-capita GDP for those countries with a GDP of at least one trillion 
-- Show per-capita GDP for the trillion dollar countries to the nearest $1000
-- # Trillions: Divided by 1000000000000
-- # Round this value to the nearest 1000

SELECT NAME, ROUND(GDP/population * 0.001, 0) * 1000
AS "PER-CAPITA GDP" 
FROM world 
WHERE GDP>= 1000000000000

-- 11. Show the name and capital where the name and the capital have the same number of characters
-- # LENGHT function - Used to find the number of characters in a string

SELECT name, capital 
FROM world 
WHERE LENGTH(name) = LENGTH (capital)

-- 12. Show the name and the capital where the first letters of each match
-- Don't include countries where the name and the capital are the same word
-- # You can use the function LEFT to isolate the first character
-- # You can use <> as the NOT EQUALS operator

SELECT name, capital
FROM world 
WHERE LEFT (name,1) = LEFT (capital,1) 
AND name <> capital

-- 13. Equatorial Guinea and Dominican Republic have all of the vowels (a e i o u) in the name. They don't count because they have more than one word in the name.
-- Find the country that has all the vowels and no spaces in its name
-- # You can use the phrase name NOT LIKE '%a%' to exclude characters from your results
-- The query shown misses countries like Bahamas and Belarus because they contain at least one 'a'

SELECT name 
FROM world 
WHERE name LIKE '%a%' 
AND NAME LIKE '%e%' 
AND NAME LIKE '%i%' 
AND NAME LIKE '%o%' 
AND NAME LIKE '%u%' 
AND name NOT LIKE '% %'
