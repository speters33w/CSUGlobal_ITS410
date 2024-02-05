USE my_guitar_shop;

INSERT INTO customers(email_address, password, first_name, last_name) 
VALUES ('rick@raven.com', '', 'Rick', 'Raven');

SELECT * FROM customers
    WHERE email_address = 'rick@raven.com';
    