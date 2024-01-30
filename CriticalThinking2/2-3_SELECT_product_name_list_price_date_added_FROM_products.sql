USE my_guitar_shop;

SELECT product_name, list_price, date_added FROM products
    WHERE list_price BETWEEN 500 AND 2000
    ORDER BY date_added DESC;