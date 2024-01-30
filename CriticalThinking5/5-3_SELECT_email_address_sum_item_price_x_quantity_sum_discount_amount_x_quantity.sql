USE my_guitar_shop;

/*
Write a SELECT statement that returns one row for each customer 
that has orders with these columns:
The email address column from the customers table
The sum of the item price in the order items table multiplied by the quantity in the order_items table
The sum of the discount amount column in the order_items table multiplied by the quantity in the order_items table
Sort the result set in descending sequence by the item price total for each customer.
*/

SELECT c.email_address, 
       sum(oi.item_price * oi.quantity) AS total_order_price, 
       sum(oi.discount_amount * oi.quantity) AS total_discount_amount
           FROM order_items oi
JOIN orders o USING (order_id)
JOIN customers c USING (customer_id)
GROUP BY c.email_address
ORDER BY total_order_price DESC;