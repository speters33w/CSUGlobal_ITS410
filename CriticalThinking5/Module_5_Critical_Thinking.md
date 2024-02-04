## Module 5: Critical Thinking

### **Writing Queries**

Using the [my_guitar_shop database](../CriticalThinking1/1-1_create_my_guitar_shop.sql) you installed in Module 1, develop the following queries.

1. Write a [SELECT statement](./5-1_SELECT_count_ALL_sum_tax_amount_FROM_orders.sql) that returns these columns:

   The count of the number of orders in the Orders table

   The sum of the tax_amount columns in the Orders table

   Execute the query and take a [screenshot](./5-1_SELECT_count_ALL_sum_tax_amount_FROM_orders.png) of the query and the results.

2. Write a [SELECT statement](./5-2_SELECT_category_name_count_category_name_max_list_price.sql) that returns one row for each category that has products with these columns:

   The category_name column from the Categories table

   The count of the products in the Products table

   The list price of the most expensive product in the Products table.

   Sort the result set so the category with the most products appears  first. Execute the query, and take a [screenshot](./5-2_SELECT_category_name_count_category_name_max_list_price.png) of the query and the  results.

3. Write a [SELECT statement](./5-3_SELECT_email_address_sum_item_price_x_quantity_sum_discount_amount_x_quantity.sql) that returns one row for each customer that has orders with these columns:

   The email_address column from the Customers table

   The sum of the item price in the Order_Items table multiplied by the quantity in the Order_Items table

   The sum of the discount amount column in the Order_Items table multiplied by the quantity in the Order_Items table

   Sort the result set in descending sequence by the item price total  for each customer. Execute the query and take a [screenshot](./5-3_SELECT_email_address_sum_item_price_x_quantity_sum_discount_amount_x_quantity.png) of the query  and the results.

4. Write a [SELECT statement](./5-4_SELECT_email_address_count_DISTINCT_order_id_sum_item_price-discount_amount_x_quantity.sql) that returns one row for each customer that has orders with these columns:

   The email_address column from the Customers table

   A count of the number of orders

   The total amount for each order (*Hint: First, subtract the discount amount from the price. Then, multiply by the quantity.*)

   Return only those rows where the customer has more than one order.  Sort the result set in descending sequence by the sum of the line item  amounts. Execute the query and take a [screenshot](./5-4_SELECT_email_address_count_DISTINCT_order_id_sum_item_price-discount_amount_x_quantity.png) of the query and the  results.

All the screenshots should show current date.

Submit your query and query results screenshots in a [Word file](./CT5_Writing_Queries.docx).