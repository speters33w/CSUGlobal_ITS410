USE my_guitar_shop;

SELECT item_id, item_price, discount_amount, quantity,
    (item_price * quantity) AS price_total,
    (discount_amount * quantity) AS discount_total,
    item_total(item_id) AS item_total
        FROM order_items
            WHERE item_total > 500
ORDER BY item_total DESC;
