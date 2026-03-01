USE SalesDB;

-- GETDATE() -> returns the current date and time at the moment when the query is executed

SELECT 
	OrderID,
	CreationTime,
	GETDATE() AS current_date_time
FROM Sales.Orders;


-- part extraction

-- 1. date  --> return the day from date
-- 2. month --> return the month from date
-- 3. year --> return the year from date

SELECT 
	OrderID,
	CreationTime,
	YEAR(CreationTime) AS year_of_date,
	MONTH(CreationTime) AS year_of_month,
	DAY(CreationTime) AS year_of_day
FROM Sales.Orders;


-- 4. DATEPART() --> Return specific part of a date as a number


SELECT 
	OrderID,
	CreationTime,
	DATEPART(YEAR,CreationTime) AS year,
	DATEPART(MONTH,CreationTime) AS month,
	DATEPART(DAY,CreationTime) AS day,
	DATEPART(HOUR,CreationTime) AS hour,
	DATEPART(MINUTE,CreationTime) AS minute,
	DATEPART(SECOND,CreationTime) AS second,
	DATEPART(QUARTER,CreationTime) AS quarter,
	DATEPART(WEEK,CreationTime) AS week
FROM Sales.Orders;


-- 5. DATENAME() --> return the name of specific part of the date

SELECT 
	OrderID,
	CreationTime,
	DATENAME(YEAR,CreationTime) AS year, --> this is string value
	DATENAME(MONTH,CreationTime) AS month,
	DATENAME(WEEKDAY,CreationTime) AS day
FROM Sales.Orders;

-- 6. DATETRUNC() --> Truncates the date to the specific part

SELECT 
	OrderID,
	CreationTime,
	DATETRUNC(MINUTE,CreationTime) AS minute_trunc,
	DATETRUNC(DAY,CreationTime) AS day_trunc
FROM Sales.Orders;

-- 7. EOMONTH() --> returns the last day of a month

SELECT 
	OrderID,
	CreationTime,
	EOMONTH(CreationTime) AS end_of_the_month,
	CAST(DATETRUNC(MONTH,CreationTime) AS DATE) AS first_day_of_month
FROM Sales.Orders;


------- USE CASES ---------------

-- 1. Data aggregations



-- TASK 

-- how many orders were placed each year

SELECT 
	YEAR(OrderDate) AS order_year,
	COUNT(*) AS no_of_orders
FROM Sales.Orders
GROUP BY YEAR(OrderDate);

-- how many orders were placed each moth

SELECT 
	DATENAME(MONTH,OrderDate) AS order_month,
	COUNT(*) AS no_of_orders
FROM Sales.Orders
GROUP BY DATENAME(MONTH,OrderDate);




-- 2. Date filtering

-- show all orders that were placed during the month of february

SELECT 
	*
FROM Sales.Orders
WHERE MONTH(OrderDate) = 2;
















