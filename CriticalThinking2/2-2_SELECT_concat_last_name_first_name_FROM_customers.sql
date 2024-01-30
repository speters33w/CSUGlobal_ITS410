USE my_guitar_shop;

SELECT concat(last_name, ", ", first_name) AS full_name
    FROM customers
    WHERE last_name BETWEEN 'M' AND 'Zzz'
    ORDER BY last_name;
    
SELECT concat(last_name, ", ", first_name) AS full_name
    FROM customers
    WHERE last_name REGEXP '^[M-Z]'
    ORDER BY last_name;
    
    