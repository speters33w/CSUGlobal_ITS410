USE my_guitar_shop;

SELECT * FROM order_items;

DROP FUNCTION IF EXISTS item_total;

DELIMITER //
CREATE FUNCTION item_total(order_item_id INT)
RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
    DECLARE line_items_total DECIMAL(10,2);
    SELECT (discount_price(order_item_id) * quantity) INTO line_items_total
    FROM order_items WHERE item_id = order_item_id;
    RETURN line_items_total;
END//
DELIMITER ;

SELECT o.item_id AS order_item_id, p.product_name, o.item_price, 
       o.discount_amount, discount_price(item_id) AS discount_price, 
       o.quantity, item_total(item_id) AS item_total
FROM order_items o
JOIN products p USING (product_id)
ORDER BY o.item_id;

SHOW FUNCTION STATUS WHERE db = 'my_guitar_shop';
