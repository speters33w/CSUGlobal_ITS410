A full tutorial using the [classicmodels](../databases/classicmodels.sql) database is available at [MySQLTutorial.org](https://www.mysqltutorial.org/mysql-stored-procedure/).

The scripts in this document use the [Accounts Payable (ap) database](../databases/create_db_ap.sql) available from the Free Downloads tab at [Murach’s MySQL (3rd Edition)](https://www.murach.com/shop/murach-s-mysql-3rd-edition-detail).

How to Create Stored Procedures and Functions is covered in Murach, J. (2019). *Murach’s MySQL* (3rd ed. pp. 445-475). Mike Murach & Associates.

## 6.1 What is Stored Procedure?

Stored procedures are SQL statements that are executed on the  database rather than a client, and they are stored as an object in the  database. The stored procedure allows reusability, meaning it is  developed once and can be used over and over again. The job of the  database administrator becomes easier as queries do not have to be  constantly developed. The main benefit of the stored procedure is that  loops, output, and manipulation variables can be used, which are not  available in regular Structured Query Language (SQL). There are other  benefits of stored procedures. Some of them are: 

- **Security** - Applications or users can execute SQL commands on the database such as  DELETE statement. You will need to provide the application read and  write access to the table. With a stored procedure, the DELETE statement or other SQL commands will reside inside the stored procedure. So, the  application or the user will only need access to the stored procedure.
- **Modular** - Stored procedures reside on the database server and not inside an application. This way they can be created independently.
- **Tune** - Database administrators can improve the performance by using database-specific tools or third-party tools.
- **Reduce network traffic** - Since the stored procedure is on the database server itself, there is no network traffic. Otherwise, the application server sends the query over the network to the database server and the results are sent back over  the network.
- **Share logic** - Business logic can be used by different applications. Stored procedures reduce the need to create the same logic.

 There are some disadvantages of stored procedures as well. They are:

- **Resource** – The database server memory usage will be extremely high since stored procedures are executed locally.
- **Troubleshooting** – Stored procedures are  hard to debug when they are issues. MySQL does not have native tools to  debug stored procedures.
- **Maintenance** – Creating and maintaining requires special training and skills.

## 6.2 Creating a Stored Procedure

The following syntax is used to create a stored procedure in MySQL:

```mysql
DELIMITER delimiter_character
CREATE PROCEDURE procedure_name (parameters)
procedure_body delimiter_character
DELIMITER ;
```

**DELIMITER** - is a statement that allows a stored procedure to be created.

**CREATE PROCEDURE** - will initiate the procedure for creating a process.

**procedure_name** - The name of the stored procedure. Always use something meaningful.

**parameters** - The specification that is going to be passed to and out of the stored procedure.

**procedure_body** - These are the actual statements or code that the store procedure will run. It is usually the largest part of the procedure.

**delimiter_character** - is a signal to end the stored procedure.

**DELIMITER** - resets the character to a semicolon.

Example: A script that creates a stored procedure that updates a table:

```mysql
USE ap;

DROP PROCEDURE IF EXISTS update_invoices_credit_total;

DELIMITER //

CREATE PROCEDURE update_invoices_credit_total
(
  invoice_id_param      INT,
  credit_total_param    DECIMAL(9,2) 
)
BEGIN
  DECLARE sql_error INT DEFAULT FALSE;
  
  DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    SET sql_error = TRUE;

  START TRANSACTION;  

  UPDATE invoices
  SET credit_total = credit_total_param
  WHERE invoice_id = invoice_id_param;

  IF sql_error = FALSE THEN
    COMMIT;
  ELSE
    ROLLBACK;
  END IF;
END//

DELIMITER ;
```

Code source: Murach, J. (2019) *Murach's MySQL*, (3rd ed. Ch 15, p. 447).

Recommended Video: Weinman, B. (2019, November 7). *[Creating a stored procedure - MySQL Video Tutorial](https://www.linkedin.com/learning/mysql-advanced-topics/creating-a-stored-procedure)*. LinkedIn. For this video, you will use the [album](../databases/album-mysql.sql) database. You will also need to run this script from Weinman, B. (2019, November 7). *[Creating a stored function - MySQL Video Tutorial](https://www.linkedin.com/learning/mysql-advanced-topics/creating-a-stored-function)* before running the list_albums procedure from the *Creating a Stored Procedure* video:

```mysql
USE album;

DROP FUNCTION IF EXISTS track_len;
DELIMITER //
CREATE FUNCTION track_len(seconds INT)
RETURNS VARCHAR(16)
DETERMINISTIC
BEGIN
    RETURN CONCAT_WS(':', seconds DIV 60, LPAD(seconds MOD 60, 2, '0' ));
END //
DELIMITER ;
```

 [SQL transcript of the video lesson](./creating_a_stored_procedure.sql)

### **Calling a Procedure**

To call a stored procedure, you only need to use the word CALL  followed by the name of the procedure. In some cases, you might want to  supply parameters.

```mysql
CALL stored_procedure_name (param1, param2, ....)
```

In the above example, we would execute the following if we wanted to execute the query.

```mysql
CALL update_invoices_credit_total(56, 200);
```

### **Modifying a Stored Procedure**

To modify a procedure, you can use ALTER PROCEDURE statement. Keep in mind, it only allows you to change parts of the procedure. You must  drop and recreate the procedure if you want to change the body of the  parameters.

### **Deleting a Stored Procedure**

There are instances where a stored procedure is not needed. It should be removed from the database server so it does not get used by anyone  or an application. To delete a procedure use, use the following  statement:

```mysql
DROP PROCEDURE IF EXISTS stored_procedure_name;
```

**IF EXISTS** is a good way to prevent errors in case the procedure does not exist. In our example, we would issue the following command:

```mysql
DROP PROCEDURE IF EXISTS update_invoices_credit_total;
```

## 6.3 MySQL Functions

Similar to stored procedures, MySQL supports functions. MySQL  functions are pieces of code that are designed to perform some action  and return a value. Do not confuse stored procedure with functions. As  you have seen, a stored procedure is used by a CALL statement and it  returns more than one value. A function can be called inside the  statement, but the function returns a single value.

Similar to other programming languages, there are built-in functions that can be used in MySQL.

- **String** – String functions manipulate string data types.
- **Numeric** – Numeric functions manipulate numeric data types.
- **Date** – Date functions manipulate date data types.
- **Aggregate** – Manipulates all three above data types and produces summaries of the results.

For a list of all the MySQL built-in functions see: W3Schools. (2020). *[MySQL Functions](https://www.w3schools.com/sql/sql_ref_mysql.asp)*. w3schools.com.

Recommended Videos on String Comparisons and Numeric Conversions:

- Weinman, B. (2019, July 16). *[String comparisons - MySQL Video Tutorial](https://www.linkedin.com/learning/mysql-essential-training-2/string-comparisons)*. LinkedIn. Bill Weinman explains that MySQL has facilities for comparing strings in several manners. For this video, you will use the [world](../databases/world-mysql.sql) database.

- Weinman, B. (2019, July 16). *[Numeric conversions - MySQL Video Tutorial](https://www.linkedin.com/learning/mysql-essential-training-2/numeric-conversions)*. LinkedIn. Bill Weinman explains that numeric values are normally expressed in  decimal base 10 using Arabic numerals. If you want to express values in  other systems, you may convert the number using one of these functions.

   [SQL transcript of the video lessons](./string_comparisons_and_numeric_conversions.sql)

### **Stored Functions**

Stored functions function exactly like the built-in functions except  they are user-defined. Stored functions can be used over and over again  once they are created just like the SQL statements. The following syntax is used to create a stored function in MySQL:

```mysql
DELIMITER //

CREATE FUNCTION function_name(
    param1,
    param2,…
)
RETURNS datatype
[NOT] DETERMINISTIC
BEGIN
 -- statements
END//

DELIMITER ;
```



### **Example of Stored Function** 

```MySQL
USE ap;

DROP FUNCTION IF EXISTS get_vendor_id;

DELIMITER //

CREATE FUNCTION get_vendor_id
(
   vendor_name_param VARCHAR(50)
)
RETURNS INT
DETERMINISTIC READS SQL DATA
BEGIN
  DECLARE vendor_id_var INT;
  
  SELECT vendor_id
  INTO vendor_id_var
  FROM vendors
  WHERE vendor_name = vendor_name_param;
  
  RETURN(vendor_id_var);
END//

DELIMITER ;
```

You can use the above example with a SELECT statement.

```mysql
SELECT invoice_number, invoice_total
FROM invoices
WHERE vendor_id = get_vendor_id('IBM');
```

Code source: Murach, J. (2019) *Murach's MySQL*, (3rd ed. Ch 15, p. 465).