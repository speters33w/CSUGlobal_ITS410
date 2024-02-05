USE my_guitar_shop;

SELECT c.category_name, p.product_id FROM categories c
LEFT JOIN products p USING (category_id)
    WHERE p.product_id IS NULL
UNION ALL
SELECT c.category_name, p.product_id FROM categories c
RIGHT JOIN products p USING (category_id)
    WHERE p.product_id IS NULL;
    