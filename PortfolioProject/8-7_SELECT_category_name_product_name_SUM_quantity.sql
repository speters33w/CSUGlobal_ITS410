USE my_guitar_shop;

DROP TABLE IF EXISTS total_quantity_purchased;
CREATE TEMPORARY TABLE total_quantity_purchased
SELECT c.category_name, p.product_name, sum(oi.quantity) AS total_quantity
FROM products p
JOIN order_items oi USING (product_id)
JOIN categories c USING (category_id)
        GROUP BY oi.product_id;
        
ALTER TABLE total_quantity_purchased
ADD PRIMARY KEY(product_name);

INSERT IGNORE INTO total_quantity_purchased (product_name, category_name, total_quantity)
SELECT p.product_name, c.category_name, 0
FROM products p
JOIN categories c USING (category_id);

SELECT * FROM total_quantity_purchased
ORDER BY category_name;