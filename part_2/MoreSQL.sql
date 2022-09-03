-- Return all columns from the people table WHERE their age is over 50 in descending order
SELECT * FROM people WHERE age > 50 ORDER BY age desc

-- Return the sum of all the ages
SELECT SUM(age) AS age_sum FROM people

-- Return min and max ages of all the people
SELECT MIN(age) AS age_min, MAX(age) AS age_max FROM people4

-- Find all active students
SELECT * FROM students WHERE isActive = 1

-- Group by age
SELECT age, COUNT(age) AS people_count FROM people GROUP BY age

-- Group by age, having more than 10 people
SELECT age, COUNT(age) AS total_people FROM people GROUP BY age HAVING COUNT(age) >= 10

-- Tutorial 5:
-- Show the total population of the world.
SELECT SUM(population)
FROM world

-- List all the continents - just once each.
SELECT DISTINCT(continent) FROM world

-- Give the total GDP of Africa
SELECT SUM(gdp) FROM world
 WHERE continent = 'Africa'

-- How many countries have an area of at least 1000000
SELECT COUNT(name) FROM world
 WHERE area >= 1000000

-- What is the total population of ('Estonia', 'Latvia', 'Lithuania')
SELECT SUM(population) FROM world
 WHERE name IN ('Estonia', 'Latvia', 'Lithuania')

-- For each continent show the continent and number of countries.
SELECT continent, COUNT(name) FROM world
 GROUP BY continent

-- For each continent show the continent and number of countries with populations of at least 10 million.
SELECT continent, COUNT(name) FROM world
 WHERE population >= 10000000
 GROUP BY continent;

-- List the continents that have a total population of at least 100 million.
SELECT continent FROM world
 GROUP BY continent HAVING SUM(population) >= 100000000