## Module 4: Critical Thinking

### **Modifying Tables**

Using the [my_guitar_shop database](../CriticalThinking1/1-1_create_my_guitar_shop.sql) you installed in Module 1, develop the following queries.

To test whether a table has been modified correctly as you do these  exercises, you can write and run an appropriate SELECT statement.

1. Write an [INSERT statement](./4-1_INSERT_INTO_categories_Brass.sql) that adds this row to the Categories table:

   category_name:        Brass

   Code the INSERT statement so MySQL automatically generates the  category_id column. Execute the query and take a [screenshot](./4-1_INSERT_INTO_categories_Brass.png) of the query and the results.

2. Write an [UPDATE  statement](./4-2_SET_category_name_Woodwinds_WHERE_category_name_Brass.sql) that modifies the row you just added to the Categories table.  This statement should change the category_name column to “Woodwinds,”  and it should use the category_id column to identify the row. Execute  the query and take a [screenshot](./4-2_SET_category_name_Woodwinds_WHERE_category_name_Brass.png) of the query and the results.

3. Write a [DELETE  statement](./4-3_DELETE_FROM_categories_WHERE_category_name_Woodwinds.sql) that deletes the row you added to the Categories table in  exercise 1. This statement should use the category_id column to identify the row. Execute the query and take a [screenshot](./4-3_DELETE_FROM_categories_WHERE_category_name_Woodwinds.png) of the query and the  results.

4. Write an [INSERT statement](./4-4_INSERT_INTO_products_Yamaha_DGX_640.sql) that adds this row to the Products table:

   | Column            | Value                               |
   | ----------------- | ----------------------------------- |
   | product_id:       | The next automatically generated ID |
   | category_id:      | 4                                   |
   | product_code:     | dgx_640                             |
   | product_name:     | Yamaha DGX 640 88-Key Digital Piano |
   | description:      | Long description to come.           |
   | list_price:       | 799.99                              |
   | discount_percent: | 0                                   |
   | date_added:       | Today’s date/time.                  |

   Use a column list for this statement. Execute the query and take a [screenshot](./4-4_INSERT_INTO_products_Yamaha_DGX_640.png) of the query and the results

All the screenshots should show current date. 

Submit your query and query results screenshots in a [Word file](./CT4_Data_Manipulation_Language.docx).