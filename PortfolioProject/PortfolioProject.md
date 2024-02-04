## Module 8: Portfolio Project 

### **Part 2: Queries**

Using the My Guitar Shop database you installed in Module 1, develop the following queries. **SUBMIT A SCREENSHOT OF EACH STEP.**

1. Write a SELECT statement that returns these column names and data from the products table:

   | Column Name      | Data                                                       |
   | ---------------- | ---------------------------------------------------------- |
   | product_name     | The product_name column                                    |
   | list_price       | The list_price column                                      |
   | discount_percent | The discount_percent column                                |
   | discount_amount  | A column that’s calculated from the previous two columns   |
   | discount_price   | A column that’s calculated from the previous three columns |

   Round the discount_amount and discount_price columns to two decimal  places. Sort the result set by the discount_price column in descending  sequence. Use the LIMIT clause so the result set contains only the first five rows. Submit a screenshot.

2. Write a SELECT statement that returns these column names and data from the order_items table:

   | Column Name     | Data                                                         |
   | --------------- | ------------------------------------------------------------ |
   | item_id         | The item_id column                                           |
   | item_price      | The item_price column                                        |
   | discount_amount | The discount_amount column                                   |
   | quantity        | The quantity column                                          |
   | price_total     | A column that’s calculated by multiplying the item price by the quantity |
   | discount_total  | A column that’s calculated by multiplying the discount amount by the quantity |
   | item_total      | A column that’s calculated by  subtracting the discount amount from the item price and then multiplying by the quantity |

   Only return rows where the item_total is greater than 500. Sort the  result set by the item_total column in descending sequence. Submit a  screenshot.

3. Write a SELECT statement that returns the product_name and list_price columns from the products table.

   Return one row for each product that has the same list price as another product.

   *Hint: Use a self-join to check that the product_id columns aren’t equal but the list_price columns are equal.*

   Sort the result set by the product_name column. Submit a screenshot.

4. Write a SELECT statement that returns these two columns:

   | Column        | From table                                         |
   | ------------- | -------------------------------------------------- |
   | category_name | The category_name column from the categories table |
   | product_id    | The product_id column from the products table      |

   Return one row for each category that has never been used. *Hint: Use an outer join and only return rows where the product_id column contains a null value.* Submit a screenshot.

5. Write an INSERT statement that adds this row to the customers table:

   ​     

   | Column         | Data           |
   | -------------- | -------------- |
   | email_address: | rick@raven.com |
   | password:      | (empty string) |
   | first_name:    | Rick           |
   | last_name:     | Raven          |

   Use a column list for this statement. Submit a screenshot.

6. Write a SELECT statement that answers this question: Which customers have ordered more than one product? Return these columns:

   The email_address column from the customers table

   The count of distinct products from the customer’s orders

   Sort the result set in ascending sequence by the email_address column. Submit a screenshot.

7. Write a SELECT statement that answers this question: What is the  total quantity purchased for each product within each category? Return  these columns

   The category_name column from the category table

   The product_name column from the products table

   The total quantity purchased for each product with orders in the order_items table

   Use the WITH ROLLUP operator to include rows that give a summary for each category name as well as a row that gives the grand total.

   Use the IF and GROUPING functions to replace null values in the  category_name and product_name columns with literal values if they’re  for summary rows. Submit a screenshot.

8. Write and execute a script that creates a user with a username using your firstname initial and lastname and password of your choosing. This user should be able to connect to MySQL from any computer.

   This user should have SELECT, INSERT, UPDATE, and DELETE privileges  for the customers, addresses, orders, and order_items tables of the my_guitar_shop database.

   However, this user should only have SELECT privileges for the  products and categories tables. Also, this user should not have the  right to grant privileges to other users.

   Check the privileges for the user by using the SHOW GRANTS statement. Submit a screenshot.

All the screenshots should show current date. 

Submit part 1 and part 2 (your query and query results screenshots) in a Word file.

*The Portfolio Project is exempt from the University Late Policy. It is due by Sunday at 11:59 p.m. of the week it is assigned.*