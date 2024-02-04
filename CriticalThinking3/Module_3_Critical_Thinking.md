# Module 3: Critical Thinking

### **Using Joins**

Using the [my_guitar_shop database](../CriticalThinking1/1-1_create_my_guitar_shop.sql) you installed in Module 1, develop the following queries.

1. Write a [SELECT statement](./3-1_SELECT_category_name_product_name_list_price.sql) that joins the Categories table to the  Products table and returns these columns: category_name, product_name,  list_price.

   Sort the result set by the category_name column and then by the  product_name column in ascending sequence. Execute the query and take a  [screenshot](./3-1_SELECT_category_name_product_name_list_price.png) of the query and the results.

2. Write a [SELECT statement](./3-2_SELECT_first_name_last_name_line1_city_state_zip_code_FROM_addresses.sql) that joins the Customers table to the  Addresses table and returns these columns: first_name, last_name, line1, city, state, zip_code.

   Return one row for each address for the customer with an email address of allan.sherwood@yahoo.com. Execute the query and take a [screenshot](./3-2_SELECT_first_name_last_name_line_1_city_state_zip_code_FROM_addresses.png) of the query and the results.

3. Write a [SELECT statement](./3-3_SELECT_first_name_last_name_line1_city_state_zip_code_FROM_addresses_INNER_JOIN.sql) that joins the Customers table to the  Addresses table and returns these columns: first_name, last_name, line1, city, state, zip_code.

   Return one row for each customer, but only return addresses that are  the shipping address for a customer. Execute the query and take a  [screenshot](./3-3_SELECT_first_name_last_name_line1_city_state_zip_code_FROM_addresses.png) of the query and the results.

4. Write a [SELECT statement](./3-4_SELECT_last_name_first_name_order_date_product_name_item_price_discount_amount_quantity.sql) that joins the Customers, Orders,  Order_Items, and Products tables. This statement should return these  columns: last_name, first_name, order_date, product_name, item_price,  discount_amount, and quantity.

   Use aliases for the tables.

   Sort the final result set by the last_name, order_date, and  product_name columns. Execute the query and take a [screenshot](./3-4_SELECT_last_name_first_name_order_date_product_name_item_price_discount_amount_quantity.png) of the  query and the results.

All the screenshots should show current date.

Submit your query and query results screenshots in a [Word file](./CT3_Joins.docx).