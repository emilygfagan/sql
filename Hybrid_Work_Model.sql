-- Task 1: Identify the top five cities that have the maximum number of employees. --
SELECT COUNT(employees.employee_id) AS 'Number Employees', locations.city AS 'City'
FROM hr.employees INNER JOIN hr.departments ON employees.department_id = departments.department_id
INNER JOIN hr.locations ON locations.location_id = departments.location_id
GROUP BY locations.city
ORDER BY COUNT(employees.employee_id) DESC
LIMIT 5;

-- Task 2: List the first names, last names, countries, cities, departments, and salaries of the employees from the top five cities identified in Task 1. --
SELECT employees.first_name AS 'First Name', employees.last_name AS 'Last Name', countries.country_name AS 'Country', locations.city AS 'City', departments.department_name AS 'Department', employees.salary AS 'Salary'
FROM hr.employees
JOIN hr.departments ON employees.department_id = departments.department_id
JOIN hr.locations ON departments.location_id = locations.location_id
JOIN hr.countries ON locations.country_id = countries.country_id
WHERE locations.city IN ('South San Francisco', 'Oxford', 'Seattle', 'Southlake', 'Toronto');

-- Task 3: List the cities in which the number of employees is less than 10. --
SELECT COUNT(employees.employee_id) AS 'Number Employees', locations.city AS 'City'
FROM hr.employees INNER JOIN hr.departments ON employees.department_id = departments.department_id
INNER JOIN hr.locations ON locations.location_id = departments.location_id
GROUP BY locations.city
HAVING COUNT(employees.employee_id) < 10;

-- Task 4: Find the average experience (in years) of the employees of each city identified in Task 3. --
SELECT employees.employee_id AS 'Employees', locations.city AS 'City', employees.hire_date AS 'Date Hired'
FROM hr.employees JOIN hr.departments ON employees.department_id = departments.department_id
JOIN hr.locations ON locations.location_id = departments.location_id
WHERE locations.city IN ('Toronto', 'London', 'Southlake', 'Munich');

-- Task 5: Find the first name, last name, email, and phone number of the employees identified in Task 1 who have also completed 10 years at the organization. --
SELECT employees.first_name AS 'First', employees.last_name AS 'Last', employees.email AS 'Email', employees.phone_number AS 'Phone Number', locations.city AS 'City'
FROM hr.employees INNER JOIN hr.departments ON employees.department_id = departments.department_id
INNER JOIN hr.locations ON locations.location_id = departments.location_id
WHERE employees.hire_date < '2013-07-29';

-- Task 6: List the IDs of the managers of the employees identified in Task 5. --
SELECT employees.first_name AS 'First', employees.last_name AS 'Last', employees.email AS 'Email', employees.phone_number AS 'Phone Number', locations.city AS 'City', employees.manager_id AS 'Manager ID'
FROM hr.employees INNER JOIN hr.departments ON employees.department_id = departments.department_id
INNER JOIN hr.locations ON locations.location_id = departments.location_id
WHERE employees.hire_date < '2013-07-29';