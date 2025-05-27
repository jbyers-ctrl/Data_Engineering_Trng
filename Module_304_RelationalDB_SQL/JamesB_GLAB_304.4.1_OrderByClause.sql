-- Calculates the subtotal of each line and sorts the subtotal
SELECT orderNumber, orderlinenumber, quantityOrdered * priceEach AS subtotal
FROM orderdetails
ORDER BY subtotal DESC;

SELECT orderNumber, orderlinenumber, quantityOrdered * priceEach AS total
FROM orderdetails
ORDER BY total;


-- Sort employees by values
SELECT firstName, lastName, reportsTo
FROM employees
ORDER BY reportsTo;

SELECT firstName, lastName, officeCode
FROM employees
ORDER BY officeCode DESC; -- sort employees by officeCode