USE my_guitar_shop;

SELECT c.category_name, p.product_name, sum(oi.quantity) AS total_quantity
FROM order_items oi
JOIN products p USING (product_id)
JOIN categories c USING (category_id)
        GROUP BY oi.product_id
        # GROUP BY p.category_id       
ORDER BY total_quantity DESC;
