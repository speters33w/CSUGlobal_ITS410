USE my_guitar_shop;

/*
Write a SELECT statement that returns one row for each customer that has orders with these columns:
The email_address column from the Customers table
A count of the number of orders
The total amount for each order (Hint: First, subtract the discount amount from the price.
Then, multiply by the quantity.)
Return only those rows where the customer has more than one order. Sort the result set in
descending sequence by the sum of the line item amounts.
*/

SELECT c.email_address, 
       count(DISTINCT o.order_id) AS number_of_orders, 
       sum((oi.item_price - oi.discount_amount) * oi.quantity) AS total_line_item_amount
           FROM order_items oi
JOIN orders o USING (order_id)
JOIN customers c USING (customer_id)
GROUP BY c.email_address
    HAVING COUNT(DISTINCT o.order_id) > 1
ORDER BY total_line_item_amount DESC;
