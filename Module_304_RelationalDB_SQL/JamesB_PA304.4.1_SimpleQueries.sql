-- Display most expensive items first
SELECT productName AS 'Name', productLine AS 'Product Line', buyPrice AS 'Buy Price'
FROM products
ORDER BY buyPrice DESC;

-- Sort employees from Germany by last name in ascending order
SELECT contactFirstName AS 'First Name', contactLastName AS 'Last Name', city AS 'City'
FROM customers
WHERE country = 'Germany'
ORDER BY contactLastName;

-- Sort unique values from the status column alphabetically
SELECT DISTINCT(status)
FROM orders;

-- Display payments made on or after 1 Jan 2005 and sort by payment date high to low
SELECT *
FROM payments
WHERE paymentDate >= 20050101
ORDER BY paymentDate DESC;

-- Display employees working in San Francisco, sorted by last name
SELECT lastName, firstName, email, jobTitle
FROM employees
WHERE 'San Francisco' IN (SELECT city FROM offices) -- all employess that are from San Francisco as the offices table
ORDER BY lastName;

-- Display all car products with vintage cars first sorted by name alphabetically and then classic cars
SELECT productName, productLine, productScale, productVendor
FROM products
WHERE productLine IN ('Vintage Cars', 'Classic Cars') -- all cars named Vintage or Classic
ORDER BY productLine DESC;