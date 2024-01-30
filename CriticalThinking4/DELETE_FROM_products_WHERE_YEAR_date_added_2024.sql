USE my_guitar_shop;

SET sql_safe_updates = false;
DELETE FROM products
WHERE year(date_added) = 2024;
SET sql_safe_updates = true;