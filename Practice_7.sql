USE hr;

-- Task 1 - List IDs, first_name, and last_name from employees working in the IT department. --
SELECT employees.employee_id AS 'Employee ID', employees.first_name AS 'First Name', employees.last_name AS 'Last Name'
FROM employees LEFT JOIN departments ON employees.department_id = departments.department_id
WHERE departments.department_name = "IT";

-- Task 2: Extract the minimum and maximum salaries of each department. --
SELECT departments.department_name AS 'Department Name', MIN(employees.salary) AS 'Minimum Salary', MAX(employees.salary) AS 'Maximum Salary'
FROM employees LEFT JOIN departments ON employees.department_id = departments.department_id
GROUP BY departments.department_name
ORDER BY MAX(employees.salary);

-- Task 3: Identify the top 10 cities that have the highest number of employees. --
SELECT COUNT(employees.employee_id) AS 'Number Employees', locations.city AS 'City', departments.department_name AS 'Department Name'
FROM employees INNER JOIN departments ON employees.department_id = departments.department_id
INNER JOIN locations ON departments.location_id = locations.location_id
GROUP BY departments.department_id
ORDER BY COUNT(employees.employee_id) DESC
LIMIT 10;

-- Task 4: List employee_id, first_name, last_name of employees whose last day working was 1999-12-31. --
SELECT employees.employee_id AS 'Employee ID', employees.first_name AS 'First Name', employees.last_name AS 'Last Name'
FROM employees INNER JOIN job_history ON employees.employee_id = job_history.employee_id
WHERE end_date = '1999-12-31';

-- Task 5: Extract the employee IDs, first names, department names, and total experience of all those employees who have completed at least 25 years in the organization. --
SELECT employees.employee_id AS 'Employee ID', employees.first_name AS 'First Name', departments.department_name AS 'Department', TIMESTAMPDIFF(year, employees.hire_date, '2023-07-26') AS 'Number of Years'
FROM employees INNER JOIN departments ON employees.department_id = departments.department_id
WHERE TIMESTAMPDIFF(year, employees.hire_date, '2023-07-26') > 24
ORDER BY TIMESTAMPDIFF(year, employees.hire_date, '2023-07-26') DESC;