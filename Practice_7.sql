USE hr;
  -- telling MySQL to use the hr database

-- Task 1 - List IDs, first_name, and last_name from employees working in the IT department. --
SELECT employees.employee_id AS 'Employee ID', employees.first_name AS 'First Name', employees.last_name AS 'Last Name'
  -- selecting appropriate columns and naming for aesthetics
FROM employees LEFT JOIN departments ON employees.department_id = departments.department_id
  -- joining employees and departments tables
WHERE departments.department_name = "IT";
  -- conditional statement where department is IT

-- Task 2: Extract the minimum and maximum salaries of each department. --
SELECT departments.department_name AS 'Department Name', MIN(employees.salary) AS 'Minimum Salary', MAX(employees.salary) AS 'Maximum Salary'
  -- selecting appropriate columns and naming for aesthetics
FROM employees LEFT JOIN departments ON employees.department_id = departments.department_id
  -- joining employees and departments tables
GROUP BY departments.department_name
  -- grouping by departments to show a list of departments
ORDER BY MAX(employees.salary);
  -- ordering by the maximum salary

-- Task 3: Identify the top 10 cities that have the highest number of employees. --
SELECT COUNT(employees.employee_id) AS 'Number Employees', locations.city AS 'City', departments.department_name AS 'Department Name'
  -- selecting appropriate columns and naming for aesthetics
FROM employees INNER JOIN departments ON employees.department_id = departments.department_id
  -- joining departments and employees tables
INNER JOIN locations ON departments.location_id = locations.location_id
  -- joining locations and departments tables
GROUP BY departments.department_id
  -- grouping by departments to show the list of departments
ORDER BY COUNT(employees.employee_id) DESC
  -- ordering by number of employees from greatest to least
LIMIT 10;
  -- only displaying the top 10

-- Task 4: List employee_id, first_name, last_name of employees whose last day working was 1999-12-31. --
SELECT employees.employee_id AS 'Employee ID', employees.first_name AS 'First Name', employees.last_name AS 'Last Name'
  -- selecting appropriate columns and naming them for aesthetics
FROM employees INNER JOIN job_history ON employees.employee_id = job_history.employee_id
  -- joining employees and job_history tables
WHERE end_date = '1999-12-31';
  -- conditional statement where last day was December 31st, 1999

-- Task 5: Extract the employee IDs, first names, department names, and total experience of all those employees who have completed at least 25 years in the organization. --
SELECT employees.employee_id AS 'Employee ID', employees.first_name AS 'First Name', departments.department_name AS 'Department', TIMESTAMPDIFF(year, employees.hire_date, '2023-07-26') AS 'Number of Years'
  -- selecting appropriate columns and naming them for aesthetics
FROM employees INNER JOIN departments ON employees.department_id = departments.department_id
  -- joining employees and departments tables
WHERE TIMESTAMPDIFF(year, employees.hire_date, '2023-07-26') > 24
  -- conditional statement to filter the employees that have worked for more than 24 years
ORDER BY TIMESTAMPDIFF(year, employees.hire_date, '2023-07-26') DESC;
  -- ordering by the employee with the most years completed
