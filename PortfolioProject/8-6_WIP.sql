USE my_guitar_shop;

SELECT c.email_address, count(oi.quantity) as count_quantity
    FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
JOIN order_items oi ON oi.order_id = o.order_id
    GROUP BY c.email_address
    HAVING count_quantity > 1
ORDER BY c.email_address;

-- todo distinct

SELECT c.email_address, count(oi.quantity) as count_quantity
    FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
JOIN order_items oi ON oi.order_id = o.order_id
    GROUP BY c.email_address
    HAVING count_quantity > 1
ORDER BY c.email_address;

