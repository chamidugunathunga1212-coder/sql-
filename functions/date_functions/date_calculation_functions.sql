USE SalesDB;

-- DATEADD() --> This function use to add or subtracts the day,month and years
SELECT
	OrderDate,
	DATEADD(DAY,-10,OrderDate) AS new_date_subtract_days,
	DATEADD(YEAR,2,OrderDate) AS new_date_add_year,
	DATEADD(MONTH,2,OrderDate) AS new_date_add_month
FROM Sales.Orders;

-- DATEDIFF() --> find the difference between two days

-- task -> calculate the age of employees

SELECT 
	BirthDate,
	GETDATE() AS current_day,
	DATEDIFF(YEAR,BirthDate,GETDATE()) AS age

FROM Sales.Employees;


-- task -> find the average shipping duration in days for each month

SELECT
	MONTH(OrderDate),
	AVG(DATEDIFF(DAY,OrderDate,ShipDate)) AS avg_dates
FROM Sales.Orders
GROUP BY MONTH(OrderDate);

-- task -> fnd the number of days between each order and previous order

-- LAG() -> this is a window function it can access a value from the previous row


SELECT 
	OrderID,
	OrderDate AS current_order_date,
	LAG(OrderDate) OVER (ORDER BY OrderDate) AS previous_order,
	DATEDIFF(DAY,LAG(OrderDate) OVER (ORDER BY OrderDate),OrderDate) AS diff_previous_order
FROM Sales.Orders;



