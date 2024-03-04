-- Discussion from another student:

#Create the function
USE my_guitar_shop;
DELIMITER //

CREATE FUNCTION GetAddressDetails2(cust_id INT)
RETURNS VARCHAR(250)
DETERMINISTIC
BEGIN
    DECLARE result VARCHAR(255);
    SELECT CONCAT_WS(', ', line1, line2, city, state, zip_code) INTO result
    FROM addresses
    WHERE cust_id = customer_id;
    RETURN result;
END//
DELIMITER ;


#Calling function to get full address for address_id 5
SELECT GetAddressDetails2 (2); #This gives a valid output
SELECT GetAddressDetails2 (1); #This is creating an error "Result consisted of more than one row."

-- Discussion response with fix.

DESCRIBE addresses;

/*
The reason SELECT GetAddressDetails2 (1) gives the error:
Error Code: 1172. Result consisted of more than one row
is because the customer_id column is not unique.
The database stores both billing and shipping addresses for the customers in the orders table, 
so in the customers table the same customer may have two addresses. 
This is true of customer_id 1, 4, 7 and 8.
*/

SELECT * FROM addresses;

/*
So you cannot use the customer id from the addresses table alone for this function
Try this query:
*/

USE my_guitar_shop;

DROP FUNCTION IF EXISTS GetAddressDetails2;
DELIMITER //

CREATE FUNCTION GetAddressDetails2(cust_id INT)
RETURNS VARCHAR(255)
DETERMINISTIC
BEGIN
    DECLARE result VARCHAR(255); # <-- this should match the return.
    SELECT CONCAT_WS(', ', a.line1, a.line2, a.city, a.state, a.zip_code) INTO result
    FROM addresses a
    INNER JOIN customers c ON a.address_id = c.shipping_address_id
        WHERE cust_id = a.customer_id;
    RETURN result;
END//
DELIMITER ;

SELECT GetAddressDetails2 (1);
SELECT GetAddressDetails2 (2);

/*
This will return the shipping address only.
*/