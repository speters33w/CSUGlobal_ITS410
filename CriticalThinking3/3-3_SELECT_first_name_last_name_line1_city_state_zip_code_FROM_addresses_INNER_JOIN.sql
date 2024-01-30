USE my_guitar_shop;

SELECT c.first_name, c.last_name, a.line1, a.city, a.state, a.zip_code FROM addresses a
    JOIN customers c ON c.customer_id = a.customer_id
    INNER JOIN orders on orders.ship_address_id = a.address_id;
       