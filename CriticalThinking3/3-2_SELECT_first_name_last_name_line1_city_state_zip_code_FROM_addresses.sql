USE my_guitar_shop;

SELECT c.first_name, c.last_name, a.line1, a.city, a.state, a.zip_code FROM addresses a
    JOIN customers c on a.customer_id = c.customer_id
    WHERE c.email_address = 'allan.sherwood@yahoo.com';
    