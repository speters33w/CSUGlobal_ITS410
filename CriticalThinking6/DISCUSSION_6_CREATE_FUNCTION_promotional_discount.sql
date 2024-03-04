USE my_guitar_shop;

DROP FUNCTION IF EXISTS promotional_discount;

# Use // to end the query instead of ;
DELIMITER //

# Create the function and its arguments.
CREATE FUNCTION promotional_discount(
    product_id int,
    promotional_discount_percent decimal(3,1)
)

# Define the return type.
RETURNS decimal(10,2)

# The function will always return the same values
# with the same input.
DETERMINISTIC

# Begin the function
BEGIN
    # Declare variables.
    # discount_price is the price with the initial discount applied.
    # promotional_discount_price is the price with the additional discount applied
    # and is the return value.
    DECLARE discount_price decimal(10,2);
    DECLARE promotional_discount_price decimal(10,2);

    # Do the math for the operation.
    # Note the promotional discount is based on the list price.
    SELECT (list_price - (list_price * discount_percent * .01))
    INTO discount_price
    FROM products WHERE products.product_id = product_id;
    SELECT (discount_price - (list_price * promotional_discount_percent * .01))
    INTO promotional_discount_price
    FROM products WHERE products.product_id = product_id;

    # Return the calculated value.
    RETURN promotional_discount_price;


END //

SHOW FUNCTION STATUS WHERE db = 'my_guitar_shop';

SELECT product_name as `The axe you always wanted`,
       list_price as `Their price`,
       promotional_discount(product_id, 5.0) as `Promotional Price`
FROM products
ORDER BY list_price DESC;

SELECT product_name as `The axe you always wanted`,
       list_price as `Their price`,
       promotional_discount(product_id, 5.0) as `Promotional Price`
FROM products
ORDER BY list_price DESC;
