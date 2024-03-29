## Module 6: Discussion Forum

Discuss the difference between stored procedure and functions. Give an example of when you would use one instead of the other.

[Stored function](./DISCUSSION_6_CREATE_FUNCTION_promotional_discount.sql) with [screenshot](./DISCUSSION_6_CREATE_FUNCTION_promotional_discount.png)

[Stored procedure](./DISCUSSION_6_CREATE_PROCEDURE_get_discount_prices.sql) with [screenshot](./DISCUSSION_6_CREATE_PROCEDURE_get_discount_prices.png)

## Module 6: Critical Thinking

### Stored Procedures

Using the [my_guitar_shop database](../CriticalThinking1/1-1_create_my_guitar_shop.sql) you installed in Module 1, develop the following queries.

1. Write a [script](./6-1_CREATE_PROCEDURE_insert_category.sql) that creates and *calls* a stored procedure named insert_category.
2. First, code a statement that creates a procedure that adds a new row to the Categories table. To do that, this procedure should have one  parameter for the category name.
3. Code at least two CALL statements that test this procedure. (Note  that this table doesn’t allow duplicate category names.) Execute the  query and take a screenshot ([screenshot 1](./6-2_CREATE_PROCEDURE_insert_category.png), [screenshot 2](./6-3_CREATE_PROCEDURE_insert_category.png)) of the query and the results.
4. Write a [script](./6-4_CREATE_FUNCTION_discount_price.sql) that creates and calls a stored function named  discount_price that calculates the discount price of an item in the  Order_Items table (discount amount subtracted from item price). To do  that, this function should accept one parameter for the item ID, and it  should return the value of the discount price for that item. Execute the query and take a [screenshot](./6-4_CREATE_FUNCTION_discount_price.png) of the query and the results.
5. Write a [script](./6-5_CREATE_FUNCTION_item_total.sql) that creates and calls a stored function named  item_total that calculates the total amount of an item in the  Order_Items table (discount price multiplied by quantity). To do that,  this function should accept one parameter for the item ID, it should use the discount_price function that you created in exercise 2, and it  should return the value of the total for that item. Execute the query  and take a [screenshot](./6-5_CREATE_FUNCTION_item_total.png) of the query and the results.

All the screenshots should show current date.

Submit your query and query results screenshots in a [Word file](./CT6_Stored_Functions_and_Procedures.docx).

