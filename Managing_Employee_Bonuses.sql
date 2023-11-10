-- Task 1: Count all employees in the organization. --
SELECT COUNT(employee_id) AS 'Total Employees'
FROM employees;

-- Task 2: Find the department-wise count of employees. --
SELECT department_id AS 'Department', COUNT(employee_id) AS 'Number of Employees'
FROM employees
GROUP BY department_id;

-- Task 3: Find the first names, last names, and salaries of employees who make more than $6,000. --
SELECT first_name, last_name, salary
FROM employees
WHERE salary>6000
ORDER BY salary DESC;

-- Task 4: Determine the count of employees who earn more than $20,000. --
SELECT COUNT(employee_id) AS 'Employee Count Above 20k'
FROM employees
WHERE salary>20000;

-- Task 5: List the details of employees who receive commission. --
SELECT *
FROM employees
WHERE commission_pct>0
ORDER BY commission_pct DESC;

-- Task 6: Extract the full names of the employees who receive a commission. --
SELECT CONCAT_WS(" ", first_name, last_name) AS 'Employee Name'
FROM employees
WHERE commission_pct>0
ORDER BY commission_pct DESC;

-- Task 7: Fetch the following details about the employees who receive commission: employee_id, employee name, email, and phone_number. --
SELECT employee_id AS 'Employee ID', CONCAT_WS(" ", first_name, last_name) AS 'Employee Full Name', email AS 'Email ID', phone_number AS 'Phone Number'
FROM employees
WHERE commission_pct>0
ORDER BY commission_pct DESC;

-- Task 8: Identify the top three department ids that have the highest total salary of employees. --
SELECT department_id AS 'Department ID', SUM(salary) AS 'Department Salary Total'
FROM employees
GROUP BY department_id
ORDER BY SUM(salary) DESC;

-- Task 9: List the details of the employees in the IT department. --
SELECT *
FROM employees
WHERE department_id = 60;

-- Task 10: Find the count of all the employees in the IT department and their average salary. --
SELECT COUNT(employee_id) AS 'Number of IT Employees', AVG(salary) AS 'Average Salary'
FROM employees;

-- Task 11: Identify the department ids and the count of employees for the departments in which salary ranges from $7,000 to $10,000. --
SELECT department_id AS 'Department ID', COUNT(employee_id) AS 'Number of Employees'
FROM employees
WHERE salary>7000 AND salary<10000
GROUP BY department_id
ORDER BY COUNT(employee_id) DESC;