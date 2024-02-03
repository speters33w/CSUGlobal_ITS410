USE world;

-- String Comparisons

SELECT name FROM country WHERE name LIKE '_a%' 
ORDER BY name;

SELECT name FROM country WHERE strcmp(name, 'France') <= 0
ORDER BY name DESC;

-- Numeric Conversions

SELECT 32742;

SELECT hex(32742);

SELECT oct(32742);

SELECT bin(32742);

SELECT conv(32742, 10, 16); # Convert from base 10 (decimal) to base 16 (hexadecemal).

SELECT conv('7FE6', 16, 10); # Convert from base 16 (hexadecemal) to base 10 (decimal). 

SELECT conv(32742, 10, 24); # Convert from base 10 (decimal) to base 24 (quadravigesimal).

SELECT conv('28K6', 24, 10); # Convert from base 24 (quadravigesimal) to base 10 (decimal).
