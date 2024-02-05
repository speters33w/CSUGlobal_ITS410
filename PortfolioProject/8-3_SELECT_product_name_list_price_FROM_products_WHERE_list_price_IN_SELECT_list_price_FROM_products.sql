USE my_guitar_shop;

SELECT product_name, list_price FROM products
    WHERE list_price IN (
        SELECT list_price FROM products
        GROUP BY list_price 
            HAVING count(list_price) > 1
);
