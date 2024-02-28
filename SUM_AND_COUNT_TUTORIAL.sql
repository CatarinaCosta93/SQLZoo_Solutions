-- # SUM and COUNT tutorial - This tutorial is about aggregate functions such as COUNT, SUM and AVG using the table world. 

-- # Table world contains: name, continent, area, population, gdp

-- 1. Show the total population of the world

SELECT SUM(population) 
FROM world

-- 2. List all the continents - just once each

SELECT DISTINCT continent          -- The DISTINCT claused is used to eliminate duplicates
FROM world

-- 3. Give the total GDP in Africa 

SELECT SUM(gdp) 
FROM world 
WHERE continent = 'Africa'

-- 4. How many countries have an area at least 1000000

SELECT COUNT(name) 
FROM world 
WHERE area >= 1000000

-- 5. What is the total population of ('Estonia', 'Latvia', 'Lithuania')

SELECT SUM(population) 
FROM world 
WHERE name IN ('Estonia', 'Latvia', 'Lithuania')

-- 6. For each continent show the continent and number of countries

SELECT continent, COUNT(name)
FROM world
GROUP BY continent

-- 7. For each continent show the continent and number of countries with populations of at least 10 million

SELECT continent, COUNT(name)
FROM world
WHERE population >= 10000000
GROUP BY continent

-- 8. SELECT continent
FROM world
GROUP BY continent
HAVING SUM(population) >= 100000000
