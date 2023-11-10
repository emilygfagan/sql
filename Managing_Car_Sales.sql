DROP DATABASE stylexcarz_db;

-- Task 1: Create database and name it stylexcarz_db --
CREATE DATABASE stylexcarz_db;

-- Task 2: Create salespersons table with columns salespersonid, salesperson_name, salesperson_city, and commission_rate. --
CREATE TABLE salespersons(
	salespersonid INT NOT NULL,
    salesperson_name TEXT NOT NULL,
    salesperson_city TEXT NOT NULL,
    commission_rate INT NOT NULL,
    PRIMARY KEY (salespersonid));
    
-- Task 2: Create customers table with columns customerid, c_firstname, c_lastname, c_city, and c_rating. --
CREATE TABLE customers(
	customerid INT NOT NULL,
    c_firstname TEXT NOT NULL,
    c_lastname TEXT NOT NULL,
    c_city TEXT NOT NULL,
    c_rating INT NOT NULL,
    PRIMARY KEY (customerid));
    
-- Task 2: Create orders table with columns orderid, amount, orderdate, salespersonid, and customerid. --
CREATE TABLE orders(
	orderid INT NOT NULL,
    amount INT NOT NULL,
    orderdate DATE,
    salespersonid INT NOT NULL,
    customerid INT NOT NULL,
    PRIMARY KEY (orderid));
-- Forgot to add the two foreign keys that reference the salesperson table and the customers table. --
ALTER TABLE orders
ADD FOREIGN KEY (salespersonid) REFERENCES salespersons(salespersonid);
ALTER TABLE orders
ADD FOREIGN KEY (customerid) REFERENCES customers(customerid);

-- Task 3: Insert the data into each table using the downloaded excel file. --
INSERT INTO salespersons
VALUES 
(1001, 'William', 'New York', 12),
(1002, 'Liam', 'New Jersey', 13),
(1003, 'Axelrod', 'San Jose', 10),
(1004, 'James', 'San Diego', 11),
(1005, 'Fran', 'Austin', 26),
(1007, 'Oliver', 'New York', 15),
(1008, 'John', 'Atlanta', 2),
(1009, 'Charles', 'New Jersey', 2);

INSERT INTO customers
VALUES
(2001, 'Hoffman', 'Anny', 'New York', 1),
(2002, 'Giovanni', 'Jenny', 'New Jersey', 2),
(2003, 'Liu', 'Williams', 'San Jose', 3),
(2004, 'Grass', 'Harry', 'San Diego', 3),
(2005, 'Clemens', 'John', 'Austin', 4),
(2006, 'Cisneros', 'Fanny', 'New York', 4),
(2007, 'Pereira', 'Johnathan', 'Atlanta', 3);

INSERT INTO orders
VALUES
(3001, 23, '2020-02-01', 1009, 2007),
(3002, 20, '2021-02-23', 1007, 2007),
(3003, 89, '2021-03-06', 1002, 2002),
(3004, 67, '2021-04-02', 1004, 2002),
(3005, 30, '2021-07-30', 1001, 2007),
(3006, 35, '2021-09-18', 1001, 2004),
(3007, 19, '2021-10-02', 1001, 2001),
(3008, 21, '2021-10-09', 1003, 2003),
(3009, 45, '2021-10-10', 1009, 2005);

-- Task 4: Update the commission of the salespersons to 15 if they are below 15. --
-- Accidentally updated every value in commission_rate to be 15. Now changing 1005 to 26 because everyone else was <15. --
UPDATE salespersons
SET commission_rate = 15
WHERE commission_rate>0 AND commission_rate<15;

-- Task 5: Create a backup of the orders table and name it orders_bkp. Store in a new database. --
CREATE DATABASE backup_stylexcarz_db;
CREATE TABLE orders_bkp LIKE stylexcarz_db.orders;
INSERT INTO orders_bkp
SELECT * FROM stylexcarz_db.orders;

-- Task 6: Increase c_rating by three points for customers that have placed an order more than once. --
UPDATE customers
SET c_rating = 5
WHERE customerid = 2002;

UPDATE customers
SET c_rating = 6
WHERE customerid = 2007;