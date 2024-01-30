USE my_guitar_shop;

/*
Write a SELECT statement that returns one row for each category 
that has products with these columns:
The category_name column from the categories table
The count of the products in the products table
The list price of the most expensive product in the products table.
Sort the result set so the category with the most products appears first.
*/

SELECT c.category_name, 
       count(c.category_name) as number_of_items_in_category, 
       max(p.list_price) AS most_expensive_in_category
           FROM categories c
JOIN products p ON c.category_id = p.category_id
GROUP BY c.category_id
ORDER BY number_of_items_in_category DESC;
