USE my_guitar_shop;

SELECT c.email_address, COUNT(DISTINCT oi.product_id) AS count
FROM customers c
INNER JOIN orders o ON c.customer_id = o.customer_id
INNER JOIN order_items oi ON o.order_id = oi.order_id
    GROUP BY c.email_address
        HAVING count > 1
ORDER BY c.email_address;
