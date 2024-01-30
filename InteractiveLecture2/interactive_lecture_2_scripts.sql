# Creates or deletes and recreates the test database.
DROP DATABASE IF EXISTS test;
CREATE DATABASE test;

# Defines the test database as the schema.
USE test;

# Deletes the tblItems table.
DROP TABLE IF EXISTS tblItems;

-- 2.1 Query Numeric Data from MySQL Tables

# Whenever you insert a record this table, the item_id field will increase by one
create table tblItems
(
                item_id int auto_increment primary key,
                item_text varchar(50)
);

# Describes the table created by the above statement.
DESCRIBE tblItems;

# Next, try the following insert statement.
insert into tblItems(item_text)
values('laptop'),('desktop'),('server'),('fibreChannelcard');

# Select the data from tblItems.
select * from test.tblItems;

# You can override the next sequential value so that it will not be five. 
# Try running the following insert statement to change the sequence values.
insert into tblItems(item_id, item_text)
values(13,'docking station');

# Select the data again and note the next sequence value for item_id is 13, not five.
select * from test.tblItems;
# The next sequence value will be 14.

# Delete the table for the next exercise.
DROP TABLE IF EXISTS tblItems;

# INT(6) will return the integer value of the field 
# and that integer value will be formatted in any display 
# to occupy six spaces with a leading pad character if necessary.
create table tblItems
(
                item_id int auto_increment primary key,
                int_1 int(2) zerofill,
                int_2 int(4) zerofill,
                item_text varchar(255)
);
insert into tblItems(int_1, int_2, item_text)
values(3, 14, 'docking station');
#  NOTE: zerofill is depreciated, learn how to use SELECT LPAD(str, len, padstr) instead.

select * from test.tblItems;

-- The MySQL DECIMAL Data Type

# Delete the table for the next exercise.
DROP TABLE IF EXISTS tblItems;

# Decimal data types are typically used to represent monetary values in accounting systems. 
# Use the following syntax to define a decimal data type;
# column_name DECIMAL(P,D)
# Practice the following SQL statements in your MySQL Workbench
create table tblItems
(
                id int auto_increment primary key,
                item_desc varchar(124),
                cost decimal(14,4) not null
);
 
insert into tblItems(item_desc, cost)
values('chainsaw',110.96),('axe',35.95),('machete',9.15);
 
select * from tblItems;
 
# Change the decimal data type below:
alter table tblItems
modify cost decimal(15,5) zerofill;
 
select * from tblItems;

-- 2.2 Date and Time Types

# Delete the table for the next exercise.
DROP TABLE IF EXISTS tblItems;

create table tblItems
(
    datetime_now datetime
);    
insert into tblItems(datetime_now)
values(NOW());

# Run the following statements to see various Date and Time Types.

select * from tblItems;

select date(datetime_now) as 'DATE' from tblItems;

select datetime_now as 'DATETIME' from tblItems;

select time(datetime_now) as 'TIME' from tblItems;

select year(datetime_now) as 'YEAR' from tblItems;

select timestamp(datetime_now) as 'TIMESTAMP' from tblItems;

-- 2.3 String Types

# Delete the table for the next exercise.
DROP TABLE IF EXISTS tblItems;

-- The MySQL CHAR Data Type

# The following is an example of a MySQL SQL statement using the CHAR data type.
create table tblItems
(
    x char(3)
);
insert into tblItems(x)
values('yes'), ('no');

select * from tblItems;
 
# You use the LENGTH function to get the length of a character string.
select x, length(x) from tblItems;

# The following statement will add ' Y' to the table and ignore the trailing space. 
insert into tblItems(x)
values(' Y ');
select x, length(x) from tblItems;
# MySQL by default does not consider trailing spaces when comparing CHAR strings. 

# The following SQL query will not return any results. Do you know why?
select  * from tblItems
where x = 'Y';
                
# Can you fix this query using LIKE to make the query return a result?
select * from tblItems
where x like ' Y';

# This statement will describe the tblItems columns.
# Notice x allows null values, and the Key for x shows blank.
DESCRIBE tblItems;

# If your CHAR column has a UNIQUE index, 
# and if you attempt to insert a value that is different from an existing value 
# in the number of trailing spaces,
# then MySQL will reject your insert attempt 
# and consider the insertion attempt as an attempt to insert a duplicate-key error.
create unique index uidx_x on tblItems(x);
DESCRIBE tblItems; -- Note the UNI in the Key column.
insert into tblItems(x) values('N');
insert into tblItems(x) values('N ');  -- this statement will fail due to the unique index

select * from tblItems;

-- The MySQL VARCHAR Data Type

# Delete the table for the next exercise.
DROP TABLE IF EXISTS tblItems;

# The maximum number of bytes that MySQL can store in a VARCHAR column is 65,535, 
# and that is 21845 characters for utf8mb3 character set 
# and 16383 characters for the utf8mb4 character set.

# The storage for a VARCHAR begins with a prefix of a one or two byte entity 
# that represents the length of the string. 

# These bytes are deducted from the maximum available storage capacity of your string.
# The maximum length of a varying length string is further constrained by the table row size. 
# Note that the total length of all columns must be less than 65,535 bytes. 

# To demonstrate this, look at the following examples:
create table tblItems
(
                string1 varchar(8191) not null,
                string2 varchar(8191) not null
) ;
# In the preceding create table statement, the row length is 65535 bytes. 
# including length prefixes, string1 and string2 consume a row length of exactly 16383 utf8mb4 characters.

# Delete the table for the next exercise.
DROP TABLE IF EXISTS tblItems;

# The following create table attempt will fail.
create table tblItems
(
                string1 varchar(8191) not null,
                string2 varchar(8192) not null
) ;

# Delete the table for the next exercise.
DROP TABLE IF EXISTS tblItems;

# An error will also be thrown if you attempt to insert a string into a VARCHAR column 
# where the string length is greater than the space allocated for the VARCHAR.
create table tblItems
(
                id int primary key auto_increment,
                string1 varchar(5) 
) ;
insert into tblItems(string1) values('minion');

select * from tblItems;

# MySQL does retain trailing spaces when it inserts or selects VARCHAR values.
insert into tblItems(string1) values('onion');
insert into tblItems(string1) values('ion  ');
insert into tblItems(string1) values('on   ');
select id, string1, length(string1)
from tblItems;

# MySQL will truncate trailing spaces when inserting a VARCHAR to make the value fit into a confined space. 
insert into tblItems(string1) values('min                       ');
select id, string1, length(string1)
from tblItems;

-- 2.4 Retrieve Data

# There are five different statements associated with the Select Statement.

# SELECT and FROM:
# This statement selects all data from the id and string1 columns of tblItems.
SELECT id, string1 FROM tblItems;

# WHERE
# This statement selects all data from the string1 column of tblItems that begin with 'o'.
SELECT string1 FROM tblItems
WHERE string1 REGEXP '^o';

# ORDER BY
# This statement selects all data from the id and string1 columns of tblItems 
# and orders it in alphabetic order from string1.
SELECT id, string1 FROM tblItems
ORDER BY string1;

# LIMIT
# This statement selects the first three lines from id and string1 columns of tblItems
SELECT id, string1 FROM tblItems
LIMIT 3;
