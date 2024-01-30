-- Sample database:
-- https://www.mysqltutorial.org/wp-content/uploads/2023/10/mysqlsampledatabase.zip
USE classicmodels;

-- 5.1 Writing Queries Using the Group By Clause

/*
The field status in the orders table is one of: 
cancelled, disputed, in process, on hold, resolved, or shipped. 
Suppose you want to know the number of orders for each status type. 
A query to do this could be:
*/
SELECT count(*), status FROM orders
GROUP BY status;

/*
Suppose you want to know the total amount of the orders by status. 
(Note: Lecture query does not work.)
A query to do this could be:
*/
SELECT sum(quantityOrdered * priceEach) as amnt, 
       status
    FROM orders
INNER JOIN  orderdetails
    USING (orderNumber)
GROUP BY status;

/*
Another query to do this could be:
*/
SELECT sum(od.quantityOrdered * od.priceEach) AS amnt, 
       o.status  FROM orders o
INNER JOIN orderdetails od ON o.orderNumber = od.orderNumber
GROUP BY o.status;

/*
Suppose you want to know the total amount for each order number. 
A query to do this could be:
*/
SELECT sum(quantityOrdered * priceEach) as total, 
       orderNumber
  FROM orderdetails
GROUP BY orderNumber;

/*
Suppose you want the total sales for each year. 
A query to do this could be:
*/
SELECT sum(quantityOrdered * priceEach) as total, 
        year(orderDate) as Year
    FROM orders
INNER JOIN orderDetails
    USING (orderNumber)
    WHERE status = 'Shipped'
GROUP BY year(orderDate);
/*
Notice that the alias "Year" cannot be used in the GROUP BY clause. 
In general, you cannot use aliases in GROUP BY clauses.
*/

-- 5.2 Writing Queries Using the Having Clause

/*
Consider the following query to find the number of items and the total amount for each order number.
*/
SELECT sum(quantityOrdered * priceEach) as total, 
       sum(quantityOrdered) as itemsCount, orderNumber
    FROM  orderDetails
GROUP BY orderNumber;

/*
Suppose you want a list of the orders that have total sales greater than $2,500.00. 
A query to do this could be:
*/
SELECT sum(quantityOrdered * priceEach) as total, 
       sum(quantityOrdered) as itemsCount, 
       orderNumber
    FROM orderDetails
GROUP BY  orderNumber
    HAVING sum(quantityOrdered * priceEach) >= 2500;
    
/*
Suppose you want a list of the orders that have total sales greater than $2500.00 
and with an item count of more than 435. 
A query to do this could be:
*/
SELECT sum(quantityOrdered * priceEach) as total,
       sum(quantityOrdered) as itemsCount,
       orderNumber
    FROM orderDetails
GROUP BY orderNumber
    HAVING sum(quantityOrdered * priceEach) >= 2500
    AND sum(quantityOrdered) >= 435;
    
/*
Suppose you want a list of all of the orders that have shipped 
with total sales of more than $1,700. 
A query to do this could be:
*/
SELECT od.ordernumber, status, 
       sum(priceeach * quantityOrdered) AS total
    FROM orderdetails od
INNER JOIN orders o ON o.ordernumber = od.ordernumber
GROUP BY ordernumber, status
    HAVING status = 'Shipped'
    AND total > 1700;
    
-- 5.3 Writing Queries Using Union

/*
Suppose you want to build a list of the first and last names 
of employees and customers. 
The following query can do this.
*/
SELECT firstName, lastName FROM employees
UNION
SELECT contactFirstName, contactLastName FROM customers;
/*
An alternative formulation of that query can be:
*/
SELECT concat(firstName, ' ', lastName) as fullName FROM employees
UNION
SELECT concat(contactFirstName, ' ', contactLastName) FROM customers
ORDER BY fullName;

# INTERSECT does not work on current releases of MySQL. 
# See https://www.mysqltutorial.org/mysql-basics/mysql-inner-join/
# for alternate solutions.

-- 5.4 Writing Subqueries

/*
The following query formulation uses a subquery to generate a list of employees 
who work in offices in the United States.
*/
SELECT concat(firstName, ' ', lastName) AS fullName FROM employees
    WHERE officecode IN
	    (SELECT officecode FROM offices
         WHERE country = 'USA'
);

/*
Suppose you want to know the customer with the greatest payment.
A possible formulation for the query can be:
*/
SELECT customerNumber, checkNumber, amount FROM payments
    WHERE amount =
    (SELECT max(amount) FROM payments
);

/*
Suppose you want a list of those customers whose purchases are above the average amount of a purchase.
*/
SELECT customerNumber, checkNumber, amount FROM payments
    WHERE amount > 
	(SELECT AVG(amount) FROM payments
);

/*
Suppose you want a list of customers in the database who have not placed any orders.
*/
SELECT customerName FROM customers
    WHERE customerNumber NOT IN
    (SELECT DISTINCT customerNumber FROM orders
);

/*
Suppose you want a list of the maximum, minimum, and average number 
of items in an order. 
Such a query makes use of the orderDetails table
*/
SELECT max(items), min(items), floor(avg(items))
    FROM
	(SELECT orderNumber, count(orderNumber) AS items
         FROM orderDetails
	GROUP BY orderNumber) as lineItems;
    
/*
Suppose you want a list of products 
whose buy prices are less than the average buy prices 
of all products in each product line. 
Such query makes use of the products table.
*/
SELECT productName, buyPrice FROM products p
    WHERE buyPrice <
    (SELECT avg(buyPrice)  FROM  products
	    WHERE productLine = p.productLine
);

/*
Suppose you want a list of orders with total values 
between $25000 and $30000. 
To formulate this query, you will need the orders and orderDetails tables.
*/
SELECT orderNumber, sum(priceEach * quantityOrdered) as total
    FROM  orderDetails od
INNER JOIN orders o
    USING (orderNumber)
GROUP BY orderNumber
    HAVING sum(priceEach * quantityOrdered) >= 25000
	AND sum(priceEach * quantityOrdered) <= 30000;
    
/*
Next, you want a list of customers who placed such orders. 
Such a query will require the use of a correlated subquery.
*/
SELECT customerNumber, customerName FROM customers
    WHERE EXISTS
    (SELECT orderNumber, sum(priceEach * quantityOrdered) as total
        FROM  orderDetails
    INNER JOIN orders o
        USING (orderNumber)
        WHERE customerNumber = customers.customerNumber
    GROUP BY  orderNumber
        HAVING sum(priceEach * quantityOrdered) >= 25000
        AND sum(priceEach * quantityOrdered) <= 30000
);
