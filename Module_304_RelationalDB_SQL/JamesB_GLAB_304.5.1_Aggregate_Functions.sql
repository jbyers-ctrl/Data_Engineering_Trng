-- MOD() Function
SELECT orderNumber, SUM(quantityOrdered) as Qty, -- use SUM() function to get total quantity of products by sales order
    IF(MOD(SUM(quantityOrdered),2),'Odd', 'Even') as oddOrEven --use MOD() function to find remainder of total quantity divided by two which results in zero or one
    -- used IF() function to display Odd and Even string based on result of MOD() function
FROM    orderdetails -- orderdetails table
GROUP BY    orderNumber -- group results from orderNumber
ORDER BY    orderNumber; -- sort rows of orderNumber

-- TRUNCATE() Function
SELECT TRUNCATE(1.555,1); -- Output: 1.5, trims decimal places

-- ROUND() Function
-- finds the average order line item values by product codes rounded to 2 decimal places
SELECT productCode, ROUND(AVG(quantityOrdered * priceEach), 2) as avg_order_value
FROM orderDetails
GROUP BY productCode;

-- REPLACE() Function
UPDATE tbl_name 
SET field_name = REPLACE(field_name, string_to_find, string_to_replace)
WHERE conditions;

-- DATEDIFF() Function
-- Return the number of days between two date values
SELECT DATEDIFF('2011-08-17','2011-08-17'); -- Output: 0
SELECT DATEDIFF('2011-08-17','2011-08-08'); -- Output: 9
SELECT DATEDIFF('2011-08-08', '2011-08-17'); -- Output: -9
SELECT DATEDIFF(CURDATE(), '2011-08-08'); -- Output: 4995
/* calculate the number of days between the required date and shipped date of the orders */
SELECT orderNumber, DATEDIFF(requiredDate, shippedDate) as daysLeft
FROM orders
ORDER BY daysLeft DESC;
/* gets all orders whose status is “In Process,” and calculates the number of days between the ordered date and the required date */
SELECT orderNumber, DATEDIFF(requiredDate, orderDate) as remaining_days
FROM orders
WHERE status = 'In Process'
ORDER BY remaining_days;
/* for calculating an interval in week or month, you can divide the returned value of the DATEDIFF() function by 7 or 30 */
SELECT orderNumber,
    ROUND(DATEDIFF(requiredDate, orderDate) / 7, 2),
    ROUND(DATEDIFF(requiredDate, orderDate) / 30, 2)
FROM orders 
WHERE status = 'In Process';

-- DATE_FORMAT()
SELECT 
    -- order date results by formatted date strings
    orderNumber,
    DATE_FORMAT(orderdate, '%Y-%m-%d') orderDate,
    DATE_FORMAT(requireddate, '%a %D %b %Y') requireddate,
    DATE_FORMAT(shippedDate, '%W %D %M %Y') shippedDate
FROM orders;

SELECT orderNumber,
    DATE_FORMAT(shippeddate, '%W %D %M %Y') as 'Shipped date'
FROM orders
ORDER BY shippeddate;

-- LPAD(str, len, padstr)

-- pads 'hi' with two '?'s up to a length of 4
SELECT LPAD('hi',4,'??');     -- Result   -> '??hi'

-- pads 'hi' with zero '?'s because length is 1
SELECT LPAD('hi',1,'??');     -- Result -> 'h'

-- pads 'firstName' with number 'k's up to specified length
SELECT firstName, LPAD(firstName,10,'kk'), LPAD(firstName,5,'kk'), LPAD(firstName,4,'kk') 
FROM classicmodels.employees;

-- TRIM() Function

-- removes both leading and trailing spaces
SELECT TRIM(' SQL TRIM Function ');

-- removes leading spaces
SELECT LTRIM('  SQL LTRIM function');

-- removes trailing spaces
SELECT RTRIM('SQL RTRIM function   ');

-- YEAR() Function

-- returns 2002
SELECT YEAR('2002-01-01');

SELECT YEAR(shippeddate) as year,  COUNT(ordernumber) as orderQty
FROM    orders 
GROUP BY YEAR(shippeddate)
ORDER BY YEAR(shippeddate);

-- DAY() Function

-- returns only the day of the month
SELECT DAY('2022-01-15'); -- result -> 15

SELECT  DAY(orderdate) as dayofmonth, COUNT(*)
FROM    orders WHERE    YEAR(orderdate) = 2004
GROUP BY dayofmonth
ORDER BY dayofmonth;
