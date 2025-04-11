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
    orderNumber,
    DATE_FORMAT(orderdate, '%Y-%m-%d') orderDate,
    DATE_FORMAT(requireddate, '%a %D %b %Y') requireddate,
    DATE_FORMAT(shippedDate, '%W %D %M %Y') shippedDate
FROM orders;

SELECT orderNumber,
    DATE_FORMAT(shippeddate, '%W %D %M %Y') as 'Shipped date'
FROM orders
ORDER BY shippeddate;
