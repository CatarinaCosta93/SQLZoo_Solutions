# SQLZoo_Solutions

-- TABLE world (name, continent, area, population, gdp)

-- 1. WHERE clause - Used to filter records
-- Ex: Show the population of Germany
  
SELECT population FROM world WHERE name = 'Germany'

-- 2. IN operator - Generally used with the WHERE clause, it allow us to check if an item is in a list
-- Ex: Show the name and population of Sweden, Norway and Denmark
  
SELECT name, population FROM world WHERE name IN ('Sweden', 'Norway', 'Denmark')

-- 3. BETWEEN operator - Select values within a given range
-- Ex: Show the country and the area for countries with an area between 200,000 and 250,000
  
SELECT name, area FROM world WHERE area BETWEEN 200000 AND 250000
