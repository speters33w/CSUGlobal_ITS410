USE my_guitar_shop;

SELECT c.category_name, p.product_name, p.list_price FROM products p
    JOIN categories c on c.category_id = p.category_id
    ORDER BY c.category_name, p.product_name;
    