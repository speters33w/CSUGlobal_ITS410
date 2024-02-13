USE my_guitar_shop;

SELECT c.category_name, p.product_name, p.list_price FROM products p
JOIN categories c ON c.category_id = p.category_id
ORDER BY c.category_id;

SELECT c.category_name, p.product_name, p.list_price FROM products p
JOIN categories c ON c.category_id = p.category_id
    WHERE p.category_id IN (
        SELECT category_id FROM products
        GROUP BY category_id 
            HAVING count(category_id) > 2
)
LIMIT 10;
