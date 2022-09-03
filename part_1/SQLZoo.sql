-- SQL Zoo

-- Tutorial 0:
-- Shows population for Germany
SELECT population FROM world 
  WHERE name = 'Germany';

-- Shows name and population for Sweden, Norway, and Denmark
SELECT name, population FROM world
  WHERE name IN ('Sweden', 'Norway', 'Denmark');

-- Shows country and area that has area between 200k - 250k
SELECT name, area FROM world
  WHERE area BETWEEN 200000 AND 250000

-- Tutorial 1:
-- Find the country that start with Y
SELECT name FROM world
  WHERE name LIKE 'Y%'

-- Find the countries that end with y
SELECT name FROM world
  WHERE name LIKE '%y'

-- Find the countries that contain the letter x
SELECT name FROM world
  WHERE name LIKE '%x%'

-- Find the countries that end with land
SELECT name FROM world
  WHERE name LIKE '%land'

-- Find the countries that start with C and end with ia
SELECT name FROM world
  WHERE name LIKE 'C%' AND name LIKE '%ia'

-- Find the country that has oo in the name
SELECT name FROM world
  WHERE name LIKE '%oo%'

-- Find the countries that have three or more a in the name
SELECT name FROM world
  WHERE name LIKE '%a%a%a%'

-- Find the countries that have "t" as the second character.
SELECT name FROM world
 WHERE name LIKE '_t%'
ORDER BY name

-- Find the countries that have two "o" characters separated by two others.
SELECT name FROM world
 WHERE name LIKE '%o__o%'

-- Find the countries that have exactly four characters.
SELECT name FROM world
 WHERE name LIKE '____'

-- Find the country where the name is the capital city.
SELECT name
  FROM world
 WHERE name = capital

-- Find the country where the capital is the country plus "City".
SELECT name
  FROM world
 WHERE capital LIKE concat(name, ' City')

-- Find the capital and the name where the capital includes the name of the country.
SELECT capital, name FROM world
 WHERE capital LIKE concat('%', name, '%')

-- Find the capital and the name where the capital is an extension of name of the country.
SELECT capital, name FROM world
 WHERE capital LIKE concat(name, '%') AND capital != name

-- Show the name and the extension where the capital is an extension of name of the country.
SELECT name, REPLACE(capital, name, '') AS extension FROM world
 WHERE capital LIKE name + '_%'

-- Tutorial 2:
-- Show the name, continent and population of all countries.
SELECT name, continent, population FROM world

-- Show the name for the countries that have a population of at least 200 million. 200 million is 200000000, there are eight zeros.
SELECT name FROM world
  WHERE population >= 200000000

-- Give the name and the per capita GDP for those countries with a population of at least 200 million.
SELECT name, (gdp/population) as GDP FROM world
  WHERE population >= 200000000

-- Show the name and population in millions for the countries of the continent 'South America'. Divide the population by 1000000 to get population in millions.
SELECT name, population / 1000000 FROM world
  WHERE continent = 'South America'

-- Show the name and population for France, Germany, Italy
SELECT name, population FROM world
 WHERE name IN ('France', 'Germany', 'Italy')

-- Show the countries which have a name that includes the word 'United'
SELECT name FROM world
 WHERE name LIKE '%United%'

-- Show the countries that are big by area or big by population. Show name, population and area.
SELECT name, population, area FROM world
 WHERE population > 250000000 OR area > 3000000

-- Exclusive OR (XOR). Show the countries that are big by area (more than 3 million) or big by population (more than 250 million) but not both. Show name, population and area.
SELECT name, population, area FROM world
 WHERE (population > 250000000 AND area <= 3000000) OR (area > 3000000 AND population < 250000000)

-- Show the name and population in millions and the GDP in billions for the countries of the continent 'South America'.
SELECT name, ROUND(population / 1000000, 2), ROUND(GDP / 1000000000, 2) FROM world
 WHERE continent = 'South America'

-- Show the name and per-capita GDP for those countries with a GDP of at least one trillion (1000000000000; that is 12 zeros). Round this value to the nearest 1000.
 SELECT name, ROUND(GDP / population, -3) FROM world
 WHERE GDP >= 1000000000000

-- Show the name and capital where the name and the capital have the same number of characters.
SELECT name, capital FROM world
 WHERE LEN(name) = LEN(capital)

-- Show the name and the capital where the first letters of each match. Don't include countries where the name and the capital are the same word.
SELECT name, capital FROM world
 WHERE LEFT(name,1) = LEFT(capital,1) AND (name != capital)

-- Find the country that has all the vowels and no spaces in its name.
SELECT name
   FROM world
WHERE name LIKE '%a%' AND name LIKE '%e%' AND name LIKE '%i%' AND name LIKE '%o%' AND name LIKE '%u%'
  AND name NOT LIKE '% %'

-- Tutorial 3:
-- Change the query shown so that it displays Nobel prizes for 1950.
SELECT yr, subject, winner
  FROM nobel
 WHERE yr = 1950

-- Show who won the 1962 prize for literature.
SELECT winner
  FROM nobel
 WHERE yr = 1962
   AND subject = 'literature'

-- Show the year and subject that won 'Albert Einstein' his prize.
SELECT yr, subject
  FROM nobel
 WHERE winner = 'Albert Einstein'

-- Give the name of the 'peace' winners since the year 2000, including 2000.
SELECT winner FROM nobel
 WHERE subject = 'peace' AND yr >= 2000

-- Show all details (yr, subject, winner) of the literature prize winners for 1980 to 1989 inclusive.
SELECT yr, subject, winner FROM nobel
 WHERE subject = 'literature' AND yr >= 1980 AND yr <= 1989

-- Show all details of the presidential winners:
-- Theodore Roosevelt
-- Thomas Woodrow Wilson
-- Jimmy Carter
-- Barack Obama
SELECT * FROM nobel
 WHERE winner IN ('Theodore Roosevelt', 'Woodrow Wilson', 'Jimmy Carter', 'Barack Obama')

-- Show the winners with first name John
SELECT winner FROM nobel
 WHERE winner LIKE 'John %'

-- Show the year, subject, and name of physics winners for 1980 together with the chemistry winners for 1984.
SELECT * FROM nobel
 WHERE (subject = 'physics' AND yr = 1980) OR (subject = 'chemistry' AND yr = 1984)

-- Show the year, subject, and name of winners for 1980 excluding chemistry and medicine
SELECT * FROM nobel
 WHERE yr = 1980 AND subject NOT IN ('chemistry' ,'medicine')

-- Show year, subject, and name of people who won a 'Medicine' prize in an early year (before 1910, not including 1910) together with winners of a 'Literature' prize in a later year (after 2004, including 2004)
SELECT * FROM nobel
 WHERE (subject = 'Medicine' AND yr < 1910) OR (subject = 'Literature' AND yr >= 2004)

-- Find all details of the prize won by PETER GRÜNBERG
SELECT * FROM nobel
 WHERE winner = 'PETER GRÜNBERG'

-- Find all details of the prize won by EUGENE O'NEILL
SELECT * FROM nobel
 WHERE winner = 'EUGENE O''NEILL'

-- List the winners, year and subject where the winner starts with Sir. Show the the most recent first, then by name order.
SELECT winner, yr, subject FROM nobel
 WHERE winner LIKE 'Sir%'
 ORDER BY yr desc, winner

-- Show the 1984 winners and subject ordered by subject and winner name; but list chemistry and physics last.
SELECT winner, subject
  FROM nobel
 WHERE yr=1984
 ORDER BY subject IN ('chemistry','physics'), subject, winner
