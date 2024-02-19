USE my_guitar_shop;

DELIMITER //

CREATE PROCEDURE get_discount_prices(
    IN promotional_discount_percent decimal(3,1)
)
BEGIN
    SELECT product_name as `The axe you always wanted`,
           list_price as `Their price`,
           promotional_discount(product_id, promotional_discount_percent)
               as `Promotional Price`
    FROM products
    ORDER BY list_price DESC;
END //
DELIMITER ;

SHOW PROCEDURE STATUS WHERE db = 'my_guitar_shop';

CALL get_discount_prices(5.0);
