The scripts in this document use the [classicmodels database](../databases/classicmodels.sql) from [MySQLTutorial.org](https://www.mysqltutorial.org/getting-started-with-mysql/mysql-sample-database/).

The scripts in this document are also available in a [single SQL file](./interactive_lecture_5_scripts.sql).

These queries from the classicmodels database may also be executed using [MySQLLive](https://www.mysqltutorial.org/tryit/) from MySQLTutorial.org.

## 5.1 Writing Queries Using the Group By Clause

The *GROUP BY* clause is used to summarize a query result set  by values of columns or expression. It may be used to reduce the number  of rows returned from a query. *GROUP BY* clauses may be used with any of the following aggregate functions:

- SUM
- MAX
- MIN
- COUNT
- AVG

The GROUP BY clause always follows a FROM clause, and if the query  has a WHERE clause, then it must follow the WHERE clause. If an  aggregate function is used in a query, then all of the columns in the  SELECT clause must appear in the GROUP BY clause. The general format of a GROUP BY clause is:

```mysql
USE classicmodels;

SELECT col_1, col_2, ..., col_n, aggregate_function(col_i)
FROM table
WHERE where_conditions
GROUP BY col_1, col_2, ..., col_n;
```

Consider the orders table:

![table relationship diagram showing the relationship between the orders table and the orderdetails table](https://www.mysqltutorial.org/wp-content/uploads/2009/12/orders_order_details_tables.png)

*classicmodels database, [https://www.mysqltutorial.org/mysql-basics/mysql-group-by/](https://www.mysqltutorial.org/mysql-basics/mysql-group-by/)*
*Figure 1: table relationship diagram showing the relationship between the orders table and the orderdetails table*

The field status in the orders table is one of: cancelled, disputed,  in process, on hold, resolved, or shipped. Suppose you want to know the  number of orders for each status type. A query to do this could be:

```mysql
USE classicmodels;

SELECT count(*), status 
FROM orders
GROUP BY status;
```

Suppose you want to know the total amount of the orders by status. A query to do this could be:

```mysql
USE classicmodels;

SELECT sum(quantityOrdered * priceEach) as amnt, status
FROM orders
INNER JOIN  orderdetails
USING (orderNumber)
GROUP BY status;
```

Another query to do this could be:

```mysql
USE classicmodels;

SELECT sum(od.quantityOrdered * od.priceEach) AS amnt, o.status 
FROM orders o
INNER JOIN orderdetails od ON o.orderNumber = od.orderNumber
GROUP BY o.status;
```

Suppose you want to know the total amount for each order number. A query to do this could be:

```mysql
USE classicmodels;

SELECT sum(quantityOrdered * priceEach) as total, orderNumber
FROM orderdetails
GROUP BY orderNumber;
```

Suppose you want the total sales for each year. A query to do this could be:

```mysql
USE classicmodels;

SELECT sum(quantityOrdered * priceEach) as total, year(orderDate) as Year
FROM orders
INNER JOIN orderdetails
USING (orderNumber)
WHERE status = 'Shipped'
GROUP BY year(orderDate);
```

Notice that the alias “Year” cannot be used in the GROUP BY clause. In general, you cannot use aliases in GROUP BY clauses.

Recommended Video: Bryla, B. (2023, December 21). *[GROUP BY clause - Oracle Database 19c: Basic SQL Video Tutorial](https://www.linkedin.com/learning/oracle-database-19c-basic-sql/group-by-clause)*. LinkedIn. 

In [GROUP BY clause](https://www.linkedin.com/learning/oracle-database-19c-basic-sql/group-by-clause), Bob Bryla shows that many of your queries will have or  require a group by clause. Bryla shows you what the group by does, where you need to use it, and how to use it. He also gives you some caveats  as well as a couple of tips about group by that aren't obvious.

## 5.2 Writing Queries Using the Having Clause

A HAVING clause in a query functions like a WHERE clause. HAVING  clauses are typically used with GROUP BY clauses to filter groups of  rows rather than filtering each row in the selection as a WHERE clause  does.

Using the orders table from Figure 1 in Page 1 of this module,  consider the following query to find the number of items and the total  amount for each order number.

```mysql
USE classicmodels;

SELECT sum(quantityOrdered * priceEach) as total, sum(quantityOrdered) as itemsCount, orderNumber
FROM  orderdetails
GROUP BY orderNumber;
```

Suppose you want a list of the orders that have total sales greater than $2,500.00. A query to do this could be:

```mysql
USE classicmodels;

SELECT sum(quantityOrdered * priceEach) as total, sum(quantityOrdered) as itemsCount, orderNumber
FROM orderdetails
GROUP BY  orderNumber
HAVING sum(quantityOrdered * priceEach) >= 2500;
```

Suppose you want a list of the orders that have total sales greater than $2500.00 and with an item count of more  than 435. A query to do this could be:

```mysql
USE classicmodels;

SELECT sum(quantityOrdered * priceEach) as total, sum(quantityOrdered) as itemsCount, orderNumber
FROM orderdetails
GROUP BY orderNumber
HAVING sum(quantityOrdered * priceEach) >= 2500
AND sum(quantityOrdered) >= 435;
```

Suppose you want a list of all of the  orders that have shipped with total sales of more than $1,700. A query  to do this could be:

```mysql
USE classicmodels;

SELECT od.ordernumber, status, sum(priceeach * quantityOrdered) AS total
FROM orderdetails od
INNER JOIN orders o ON o.ordernumber = od.ordernumber
GROUP BY ordernumber, status
HAVING status = 'Shipped'
AND total > 1700;
```

Recommended Video: Bryla, B. (2023, December 21). *[HAVING clause - Oracle Database 19c: Basic SQL Video Tutorial](https://www.linkedin.com/learning/oracle-database-19c-basic-sql/having-clause)*. LinkedIn. 

In [HAVING clause](https://www.linkedin.com/learning/oracle-database-19c-basic-sql/having-clause) (LinkedIn.com), Bob Bryla explains that if you have a HAVING clause in  your SELECT statement, that means you must have a GROUP BY as well. He  shows you where HAVING is allowed, how to use it, and some other options you can use with HAVING. The HAVING clause is a filter, but for the  GROUP BY clause.

## 5.3 Writing Queries Using Union

The UNION statement in a query is used to combine the result sets of  two or more subqueries into a single result set. To combine two or more  result sets in this fashion, each result set must have the same number  and order of columns and the data types of the columns must be the same. The general form of a UNION clause is:

```mysql
SELECT column_list
UNION [DISTINCT | ALL]
SELECT column_list
UNION [DISTINCT | ALL]
SELECT column_list
...
```

By default, the UNION operator removes  duplicate rows. If you wish to include duplicate rows, then use UNION  ALL. Be careful not to confuse UNION with JOIN. A table join combines  result sets horizontally whereas a union combines result sets  vertically. The following figure depicts this distinction.

![Tables representing the logical distinction between UNION and INNER JOIN](https://www.mysqltutorial.org/wp-content/uploads/2009/12/MySQL-UNION-vs-JOIN.png)

*classicmodels database, [https://www.mysqltutorial.org/mysql-basics/mysql-union/](https://www.mysqltutorial.org/mysql-basics/mysql-union/)*
*Figure 2: Logical distinction between UNION and INNER JOIN*

Consider the customers table from the classicmodels database.

![table definition for the customers table](https://www.mysqltutorial.org/wp-content/uploads/2023/10/customers.svg)

*classicmodels database, [https://www.mysqltutorial.org/mysql-views/mysql-view-processing-algorithms/](https://www.mysqltutorial.org/mysql-views/mysql-view-processing-algorithms/)*
*Figure 3: Table definition for the customers table in the classicmodels database*

Now consider the employees table from the classicmodels database.

![table definition for the customers table](https://www.mysqltutorial.org/wp-content/uploads/2023/10/employees.svg)

*classicmodels database, [https://www.mysqltutorial.org/mysql-basics/mysql-alias/](https://www.mysqltutorial.org/mysql-basics/mysql-alias/)*
*Figure 4: Table definition for the employees table in the classicmodels database*

Suppose you want to build a list of the first and last names of employees and customers. The following query can do this.

```mysql
SELECT firstName, lastName 
FROM employees
UNION
SELECT contactFirstName, contactLastName 
FROM customers;
```

An alternative formulation of that query can be:

```mysql
SELECT concat(firstName, ' ', lastName) as fullName 
FROM employees
UNION
SELECT concat(contactFirstName, ' ', contactLastName) 
FROM customers
ORDER BY fullName;
```

## 5.4 Writing Subqueries

A subquery is a query within a query. You can place subqueries into the following SQL clauses: *SELECT, INSERT, UPDATE*, or *DELETE*. Suppose you want a list of employees who work in offices in the United States. The *offices* table from the classicmodels database has the following structure.

![Table titled Offices (officeCode, city, phone, addressLine1, addressLine2, state, country, postalCode, territory)](https://www.mysqltutorial.org/wp-content/uploads/2023/10/offices.svg)

*classicmodels database, [https://www.mysqltutorial.org/mysql-basics/mysql-not-in/](https://www.mysqltutorial.org/mysql-basics/mysql-not-in/)*
*Figure 5: Table definition for the offices table in the classicmodels database*

The following query formulation uses a subquery to generate this list.

```mysql
SELECT concat(firstName, ' ', lastName) AS fullName 
FROM employees
    WHERE officecode IN
	    (SELECT officecode FROM offices
         WHERE country = 'USA'
);
```

In this query, the subquery is the query  in parentheses and returns all office codes of the offices located in  the United States. The outer query--that is, the query that makes use of the subquery, or inner query--selects the names of employees whose  office codes are contained in the list generated by the subquery.    

Suppose you want to know the customer with the greatest payment. Such a query needs to make use of the customers table as shown in Figure 3  as well as the payments table as shown in the figure below.

![Table titled payments (customerNumber, checkNumber, paymentDate, amount)](https://www.mysqltutorial.org/wp-content/uploads/2019/08/payments.png)

*classicmodels database*, *[https://www.mysqltutorial.org/mysql-basics/mysql-subquery/](https://www.mysqltutorial.org/mysql-basics/mysql-subquery/)*
*Figure 6: Table definition for the payments table in the classicmodels database*

A possible formulation for the query can be:

```mysql
SELECT customerNumber, checkNumber, amount 
FROM payments
    WHERE amount =
        (SELECT max(amount) FROM payments
);
```

Suppose you want a list of those customers whose purchases are above the average amount of a purchase.

```mysql
SELECT customerNumber, checkNumber, amount 
FROM payments
    WHERE amount > 
	    (SELECT AVG(amount) FROM payments
);
```

Suppose you want a list of potential  customers, that is, customers in the database who have not placed any  orders. You will need the customers and orders table to generate this  list.

![Table schemas and table relationship of the customers and orders tables ](https://www.mysqltutorial.org/wp-content/uploads/2019/08/customers-orders.png)

*classicmodels database*, *[https://www.mysqltutorial.org/mysql-basics/mysql-subquery/](https://www.mysqltutorial.org/mysql-basics/mysql-subquery/)*
*Figure 7: Table schemas and table relationship of the customers and orders tables from the classicmodels database*

```mysql
SELECT customerName FROM customers
    WHERE customerNumber NOT IN
        (SELECT DISTINCT customerNumber FROM orders
);
```

Suppose you want a list of the maximum,  minimum, and average number of items in an order. Such a query makes use of the orderDetails table shown in Figure 1.

```mysql
SELECT max(items), min(items), floor(avg(items))
FROM
   (SELECT orderNumber, count(orderNumber) AS items
    FROM orderdetails
	GROUP BY orderNumber) 
as lineItems;
```

The previous subquery examples were based  on a structure where the inner query produced a result set independent  of the outer query. Cases exist where the inner query result set depends on the result set from the outer query. Such subqueries are known as  correlated subqueries. A correlated subquery is evaluated for each row  generated by the outer query.

Suppose you want a list of products whose  buy prices are less than the average buy prices of all products in each  product line. Such query makes use of the products table.

![ Table schema and table relationship of productLines and products tables ](https://www.mysqltutorial.org/wp-content/uploads/2019/08/products-productlines-tables.png)

*classicmodels database, [https://www.mysqltutorial.org/mysql-basics/mysql-inner-join/](https://www.mysqltutorial.org/mysql-basics/mysql-inner-join/)*
*Figure 8: Table schema and table relationship of the productLines and products tables from the classicmodels database*

```mysql
SELECT productName, buyPrice 
FROM products p
    WHERE buyPrice <
        (SELECT avg(buyPrice)  FROM  products
	    WHERE productLine = p.productLine
);
```

The correlated query runs for every  product line. The outer query lists only products with a buy price less  than the average buy price per product line listed in the results set  from the correlated subquery.

Suppose you want a list of orders with  total values between $25000 and $30000. To formulate this query, you  will need the orders and orderDetails tables as shown in Figure 1.

```mysql
SELECT orderNumber, sum(priceEach * quantityOrdered) as total
FROM  orderdetails od
INNER JOIN orders o
    USING (orderNumber)
GROUP BY orderNumber
    HAVING sum(priceEach * quantityOrdered) >= 25000
	AND sum(priceEach * quantityOrdered) <= 30000;
```

Next, you want a list of customers who placed such orders. Such a query will require the use of a correlated subquery.

```mysql
SELECT customerNumber, customerName 
FROM customers
    WHERE EXISTS
       (SELECT orderNumber, sum(priceEach * quantityOrdered) as total
        FROM  orderdetails
    INNER JOIN orders o
        USING (orderNumber)
        WHERE customerNumber = customers.customerNumber
    GROUP BY  orderNumber
        HAVING sum(priceEach * quantityOrdered) >= 25000
        AND sum(priceEach * quantityOrdered) <= 30000
);
```

The *EXISTS* clause evaluates to  true if the subquery returns at least one row. If the subquery does not  return any rows then the entire query will not return any rows.