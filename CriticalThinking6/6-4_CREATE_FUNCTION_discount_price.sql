USE my_guitar_shop;

SELECT * FROM order_items;

DROP FUNCTION IF EXISTS discount_price;

DELIMITER //
CREATE FUNCTION discount_price(order_item_id INT)
RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
    DECLARE actual_price DECIMAL(10,2);
    SELECT (item_price - discount_amount) INTO actual_price
    FROM order_items WHERE item_id = order_item_id;
    RETURN actual_price;
END//
DELIMITER ;

SELECT o.item_id AS order_item_id, p.product_name, o.item_price, o.discount_amount,
       discount_price(item_id) AS discount_price
FROM order_items o
JOIN products p USING (product_id)
ORDER BY o.item_id;

SHOW FUNCTION STATUS WHERE db = 'my_guitar_shop';