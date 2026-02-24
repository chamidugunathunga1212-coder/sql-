USE MyDatabase;


-- SELECT 

-- Retrieve the all records in customer table
SELECT *
FROM dbo.customers;

-- Retrieve the all records in orders table
SELECT * 
FROM dbo.orders;

-- Retrieve each customer's name , country and score

SELECT 
	first_name,
	country,
	score
FROM dbo.customers;


-- WHERE clause examples


-- Retrieve customers with score not equal to 0

SELECT 
	*
FROM dbo.customers
WHERE score != 0;

-- Retrieve cutomers from USA

SELECT 
	*
FROM dbo.customers
WHERE country = 'USA'

-- Retrieve each customer's name and country from USA

SELECT 
	first_name,
	country
FROM dbo.customers
WHERE country = 'USA'


-- ORDER BY clause examples

-- Retrieve all customers and sort the result by the highest score first

SELECT *
FROM dbo.customers
ORDER BY score DESC; 


-- Retrieve all customers and sort the result by the lowest score first

SELECT *
FROM dbo.customers
ORDER BY score ASC;

-- Nexted ORDER BY example

/* Retrieve all customers and sort the result by country in ascending order and 
   then by score in descending order */

SELECT *
FROM dbo.customers
ORDER BY country ASC,score DESC;

-- first sort by score in descending order and then by country in ascending order
SELECT *
FROM dbo.customers
ORDER BY score DESC,country ASC;


-- Group BY clause examples - used with aggregate functions like SUM, COUNT, AVG, MAX, MIN

-- Find the total score for each country

SELECT 
	country,
	SUM(score) AS total_score
FROM dbo.customers
GROUP BY country;


-- Find the total score and total number of customers for each country

SELECT 
	country,
	SUM(score) AS total_score,
	COUnt(id) AS total_customers
FROM dbo.customers
GROUP BY country;


-- HAVING clause examples - used to filter groups based on aggregate functions



SELECT 
	country,
	AVG(score) AS average_score
FROM dbo.customers
WHERE score != 0
GROUP BY country
HAVING AVG(score) > 430


-- DISTINCT keyword examples - used to return only distinct (different) values

-- Unique countries in the customers table
SELECT DISTINCT country
FROM dbo.customers;


-- Top keyword examples - used to specify the number of records to return

-- Retrieve the top 3 customers with the highest score

SELECT TOP 3 *
FROM dbo.customers
ORDER BY score DESC

-- Retrieve the top 2 customers with the lowest score
SELECT TOP 2 *
FROM dbo.customers
ORDER BY score ASC

-- Get two most recent orders from the orders table
SELECT TOP 2 *
FROM dbo.orders
ORDER BY order_date DESC;
