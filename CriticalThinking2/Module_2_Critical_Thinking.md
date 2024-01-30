## Module 2: Critical Thinking

### **Guitar Shop Database**

Using the [My Guitar Shop database](../CriticalThinking1/1-1_create_my_guitar_shop.sql) you installed in Module 1, develop the following queries.

1. Write a [SELECT statement](./2-1_SELECT_product_code_product_name_list_price_discount_percent_FROM_products.sql) that returns four columns from the Products table: product_code, product_name, list_price, and discount_percent.  Then, run this statement to make sure it works correctly. Take a  [screenshot](./2-1_SELECT_product_code_product_name_list_price_discount_percent_FROM_products.png) of the query and results.

2. Write a [SELECT statement](./2-2_SELECT_concat_last_name_first_name_FROM_customers.sql) that returns one column from the Customers  table named full_name that joins the last_name and first_name columns.

   Format this column with the last name, a comma, a space, and the first name like this:

      **Doe, John**

   Sort the result set by the last_name column in ascending sequence.

   Return only the customers whose last names begin with letters from M  to Z. Execute the query and take a [screenshot](./2-2_SELECT_concat_last_name_first_name_FROM_customers.png) of the query and the  results.

   **NOTE**: When comparing strings of characters, ‘M’  comes before any string of characters that begins with ‘M’. For example, ‘M’ comes before ‘Murach’.

3. Write a [SELECT statement](./2-3_SELECT_product_name_list_price_date_added_FROM_products.sql) that returns these columns from the Products table:

   | product_name   | The product_name column   |
   | -------------- | ------------------------- |
   | **list_price** | **The list_price column** |
   | **date_added** | **The date_added column** |

   Return only the rows with a list price that’s greater than 500 and less than 2000.

   Sort the result set by the date_added column in descending sequence.  Execute the query and take a [screenshot](./2-3_SELECT_product_name_list_price_date_added_FROM_products.png) of the query and the results.

All the screenshots should show current date.

Submit your query and query results screenshots in a [Word file](./CT2_Select_Statements.docx).