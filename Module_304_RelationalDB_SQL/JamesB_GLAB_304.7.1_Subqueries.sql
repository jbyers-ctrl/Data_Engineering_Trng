/* *** Subquery within the WHERE clause *** */
-- IN Operator
-- find all employees who are located at the location with the ID 1700
SELECT employee_id, first_name, last_name, department_id
FROM employees
                        -- subquery to find all departments located at the location_id is 1700
WHERE department_id IN (SELECT department_id FROM departments WHERE location_id = 1700)
ORDER BY first_name, last_name
-- NOT IN Operator
-- find all employees' information who are not located at location 1700
SELECT employee_id, first_name, last_name
FROM employees
WHERE department_id NOT IN (SELECT department_id FROM departments WHERE location_id = 1700)
ORDER BY first_name, last_name;

/* comparison operators (=, >, =, <= , !=) */
-- find employees who have the highest salary
SELECT employee_id, first_name, last_name, salary
FROM employees
WHERE salary = (SELECT MAX(salary) FROM employees)
ORDER BY first_name, last_name; -- the subquery returns the highest salary of all employees, and the outer query finds the employees whose salary is equal to the highest one

-- find the employee number, name, and salary for employees whose salary is higher than the average salary throughout the company
SELECT employee_id, first_name, last_name, salary
FROM employees
WHERE salary > (SELECT AVG(salary) FROM employees); -- the subquery returns the average salary of all employees. Then the outer query uses the greater than operator ( > ) to find all employees whose salaries are greater than the average

/* EXISTS or NOT EXISTS operators */
-- find all departments that have at least one employee with a salary greater than 10,000.
SELECT department_name
FROM departments d
WHERE EXISTS (SELECT * FROM employees e WHERE salary > 10000 AND e.department_id = d.department_id)
ORDER BY department_name;

SELECT department_name
FROM departments d
WHERE NOT EXISTS (SELECT * FROM employees e WHERE salary > 10000 AND e.department_id = d.department_id)
ORDER BY department_name;

/* *** Subquery within the FROM clause *** */
-- Syntax
SELECT  * FROM (subquery) AS table_name_alias -- table alias is mandatory because all tables in FROM clause must have a name

-- returns the average salary of every department
SELECT AVG(salary) average_salary
FROM employees 
GROUP BY department_id;
-- round the average salary of the average salary of all departments
SELECT ROUND(AVG(average_salary), 0)
FROM (SELECT AVG(salary) as average_salary FROM employees GROUP BY department_id) department_salary;

-- returns top five products by sales revenue in 2003 from orders and orderdetails tables
SELECT productCode, ROUND(SUM(quantityOrdered * priceEach)) AS sales
FROM orderdetails
	INNER JOIN orders USING (orderNumber)
WHERE YEAR(shippedDate) = 2003
GROUP BY productCode
ORDER BY sales DESC
LIMIT 5;

-- use result of query above as a derived table and join it with the products table below
-- the subquery is executed to create a result set or derived table
--  the outer query is executed that joins the top5product2003 derived table with the products table using the productCode column
SELECT productName, sales
FROM  (SELECT productCode, ROUND(SUM(quantityOrdered * priceEach)) AS sales
    FROM orderdetails  INNER JOIN orders USING (orderNumber)
    WHERE YEAR(shippedDate) = 2003
    GROUP BY productCode
    ORDER BY sales DESC
    LIMIT 5) as top5products2003
INNER JOIN products USING (productCode);
