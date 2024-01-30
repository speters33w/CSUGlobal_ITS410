USE my_guitar_shop;

SELECT c.last_name, c.first_name, o.order_date, p.product_name, oi.item_price, oi.discount_amount, oi.quantity 
    FROM order_items oi 
    JOIN products p ON p.product_id = oi.product_id 
    JOIN orders o ON  o.order_id = oi.order_id
    JOIN customers c ON o.customer_id = c.customer_id
    ORDER BY c.last_name, o.order_date, p.product_name;
    