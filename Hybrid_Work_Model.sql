-- Task 1: Identify the top five cities that have the maximum number of employees.

SELECT COUNT(employees.employee_id) AS 'Number Employees', locations.city AS 'City' 
  -- selecting the count of employee id from the employees table titled number of employees, and the city column from locations table titled city
FROM hr.employees INNER JOIN hr.departments ON employees.department_id = departments.department_id
  -- joining the employees table with the departments table
INNER JOIN hr.locations ON locations.location_id = departments.location_id
  -- joining the locations table with the departments table
GROUP BY locations.city
  -- grouping by city so that I can see the top 5 cities and their counts
ORDER BY COUNT(employees.employee_id) DESC
  -- ordering from greatest to least
LIMIT 5;
  -- taking the top 5


-- Task 2: List the first names, last names, countries, cities, departments, and salaries of the employees from the top five cities identified in Task 1.

SELECT employees.first_name AS 'First Name', employees.last_name AS 'Last Name', countries.country_name AS 'Country', locations.city AS 'City', 
  departments.department_name AS 'Department', employees.salary AS 'Salary'
-- selecting all the necessary columns and naming them for aesthetic purposes
FROM hr.employees
JOIN hr.departments ON employees.department_id = departments.department_id
  -- joining the employees and departments tables
JOIN hr.locations ON departments.location_id = locations.location_id
  -- joining the locations and departments tables
JOIN hr.countries ON locations.country_id = countries.country_id
  -- joining the countries and locations tables
WHERE locations.city IN ('South San Francisco', 'Oxford', 'Seattle', 'Southlake', 'Toronto');
  -- condition statement that includes the top 5 cities found in task 1


-- Task 3: List the cities in which the number of employees is less than 10.

SELECT COUNT(employees.employee_id) AS 'Number Employees', locations.city AS 'City'
  -- selecting count of employee id and city and naming them for aesthetic purposes
FROM hr.employees INNER JOIN hr.departments ON employees.department_id = departments.department_id
  -- joining employees and departments tables
INNER JOIN hr.locations ON locations.location_id = departments.location_id
  -- joining locations and departments tables
GROUP BY locations.city
  -- grouping by city in order to see the counts of each city
HAVING COUNT(employees.employee_id) < 10;
  -- condition statement where the employee count is less than 10


-- Task 4: Find the average experience (in years) of the employees of each city identified in Task 3.

SELECT employees.employee_id AS 'Employees', locations.city AS 'City', employees.hire_date AS 'Date Hired'
  -- selecting necessary columns and naming them for aesthetic purposes
FROM hr.employees JOIN hr.departments ON employees.department_id = departments.department_id
  -- joining employees and departments tables
JOIN hr.locations ON locations.location_id = departments.location_id
  -- joining locations and departments tables
WHERE locations.city IN ('Toronto', 'London', 'Southlake', 'Munich');
  -- condition statement that includes the cities found in previous task


-- Task 5: Find the first name, last name, email, and phone number of the employees identified in Task 1 who have also completed 10 years at the organization.

SELECT employees.first_name AS 'First', employees.last_name AS 'Last', employees.email AS 'Email', employees.phone_number AS 'Phone Number', 
  locations.city AS 'City'
  -- selecting necessary columns and naming them
FROM hr.employees INNER JOIN hr.departments ON employees.department_id = departments.department_id
  -- joining employees and departments tables
INNER JOIN hr.locations ON locations.location_id = departments.location_id
  -- joining locations and departments tables
WHERE employees.hire_date < '2013-07-29';
  -- condition statement where employees have spent 10 years at the organization


-- Task 6: List the IDs of the managers of the employees identified in Task 5.

SELECT employees.first_name AS 'First', employees.last_name AS 'Last', employees.email AS 'Email', employees.phone_number AS 'Phone Number', 
  locations.city AS 'City', employees.manager_id AS 'Manager ID'
  -- selecting necessary columns and naming them
FROM hr.employees INNER JOIN hr.departments ON employees.department_id = departments.department_id
  -- joining employees and departments tables
INNER JOIN hr.locations ON locations.location_id = departments.location_id
  -- joining locations and departments tables
WHERE employees.hire_date < '2013-07-29';
  -- condition statement where employees have spent 10 years at the organization
