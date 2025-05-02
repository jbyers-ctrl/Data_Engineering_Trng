-- 'OR' Operator example

-- return customers who are located in USA or France
SELECT    customername, country
FROM    customers
WHERE    country = 'USA' OR country = 'France';

-- 'AND' Operator example

-- return customers records located in USA or France and have credit limit greater than 100,000
SELECT    customername, country, creditLimit  
FROM    customers
WHERE (country = 'USA' OR country = 'France') AND creditlimit > 100000;

-- return customers who are located in USA or customers who are located in France with a credit limit greater than 100,000
SELECT  customername, country, creditLimit FROM    customers
WHERE    country = 'USA' OR country = 'France' AND creditlimit > 100000;

-- BETWEEN and NOT BETWEEN Operator

-- find products whose buy prices are within the ranges of 90 and 100
SELECT     productCode,  productName,  buyPrice 
FROM    products
WHERE     buyPrice BETWEEN 90 AND 100;

-- find the product whose buy price is not between $20 and $100
SELECT productCode, productName, buyPrice FROM products 
WHERE buyPrice NOT BETWEEN 20 AND 100;

-- IS NULL Operator

-- find customers who do not have a sales representative
SELECT customerName, country, salesrepemployeenumber
FROM customers
WHERE salesrepemployeenumber IS NULL
ORDER BY  customerName; 

-- get the customers who have a sales representative
SELECT customerName, country, salesrepemployeenumber
FROM  customers
WHERE  salesrepemployeenumber IS NOT NULL
ORDER BY customerName;

-- uses LEFT JOIN predicate and IS NULL operator to find customers who have no order
SELECT  c.customerNumber, c.customerName,  orderNumber, o.STATUS
FROM customers c
LEFT JOIN orders o 
ON c.customerNumber = o.customerNumber
WHERE  orderNumber IS NULL;
