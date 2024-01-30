## Module 1: Critical Thinking              

### Create MySQL Database

You will use MySQL Workbench to create the My Guitar Shop database to review the tables in this database and to enter SQL statements and run  them against this database.

**Make sure the MySQL server is running**

1. Start MySQL Workbench and open a connection for the root user.

2. Check whether the MySQL server is running. If it isn’t, start it.

   **Use MySQL Workbench to create the My Guitar Shop database.**

3. Download and open the [my_guitar_shop](./1-1_create_my_guitar_shop.sql) SQL script file by clicking the Open SQL Script File button in the SQL Editor toolbar.  Then, use the resulting dialog box to locate and open the file. 

Execute the entire script by clicking the Execute SQL Script button  in the SQL editor toolbar or by pressing Ctrl+Shift+Enter. When you do,  the Output window displays messages that indicate whether the script  executed successfully. Take a screenshot.

**Use MySQL Workbench to enter and run SQL statements**

Double-click on the my_guitar_shop database to set it as the default database. When you do that, MySQL Workbench should display the database in bold.

Open a SQL editor tab. Then, enter and run [this SQL statement](./1-2_SELECT_product_name_FROM_products.sql):

**SELECT product_name FROM products**

Take a resulting [screenshot](./1-2_SELECT_product_name_FROM_products.png).

Delete the *e* at the end of product_name and run the  statement again. Note the error number and the description of the error. Take a resulting [screenshot](./1-2b_SELECT_product_nam_FROM_products.png).

Open another SQL editor tab. Then, enter and run [this statement](./1-3_SELECT_COUNT_AS_number_of_products.sql):

**SELECT COUNT(\*) AS number_of_products**

**FROM products**

**Use MySQL Workbench to open and run scripts**

Download and open the  [product details script](./1-4_product_details.sql). Note that this script contains just one SQL statement. Then, run the statement. Take a resulting [screenshot](./1-4_product_details.sql).

Download and open the [product summary script](./1-5_product_summary.sql). Note that this opens another SQL editor tab. Then, run the statement. Take a resulting [screenshot](./1-5_product_summary.png).

Download and open the [product statements script](./1-6_product_statements.sql). Notice that this script contains two SQL statements that end with semicolons. Then, run the statement. Take a resulting [screenshot](./1-6b_product_statements_b.png).

All the screenshots should show current date.

Submit your labeled results screenshots in a [Word file](./CT1_Create_MySQL_Database.docx).