MySQL provides a LOAD DATA utility that allows you to load (import)  data.  The syntax for loading data as a CSV file named discounts.csv into  MySQL table discounts is the following:

```
LOAD DATA LOCAL INFILE 'c:/data/abc.csv'
INTO TABLE abc
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES
(col1, col2, col3, col4, col5);
```

Each value is enclosed by double quotation marks indicated by the  ENCLOSED BY `”`  clause. This prevents a data field value that may  contain a comma (,) from being interpreted as the field separator. Each  line is terminated by a sequence of carriage returns and line feed  characters specified by the LINES TERMINATED ‘\r\n’ clause. The IGNORE…  statement indicates that the first line of the CSV file is a header row  and does not contain data. The last line, (col1, col2, col3, col4,  col5...); is a mapping from a column in the CSV file to a table column.  In this example, column one of the CSV file is mapped to the first  column of the MySQL table, column two of the CSV file is mapped to the  second column of the MySQL table, and so on. If you do not want to load a particular column, then replace coln, where n is the column number,  with the keyword @dummy. When you do this, that particular column will  be skipped during the loading process.