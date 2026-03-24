-- COUNT() -> return a number of rows within a window

-- find the total number of orders for each product procide orderID and orderDate

SELECT 
	OrderID,
	ProductID,
	OrderDate,
	Sales,
	COUNT(*) OVER (PARTITION BY ProductID) AS tot_orders 
FROM Sales.Orders


-- find the total number of orders for each customer procide orderID and orderDate


SELECT 
	OrderID,
	ProductID,
	CustomerID,
	COUNT(*) OVER (PARTITION BY CustomerID) AS tot_orders_by_customers
FROM Sales.Orders;


-- find the total number of customers additionally provide all customers details

SELECT *,
	COUNT(*) OVER () AS tot_count_of_customers
FROM Sales.Customers;

-- find the total number of scores for the customers

SELECT *,
	COUNT(Score) OVER () AS tot_number_of_score
FROM Sales.Customers;


-- user case -> check whether the table orders contains any duplicate rows

SELECT 
	OrderID,
	COUNT(*) OVER (PARTITION BY OrderID) AS check_pk
FROM Sales.Orders;


SELECT 
	OrderID,
	COUNT(*) OVER (PARTITION BY OrderID) AS check_pk
FROM Sales.OrdersArchive;



-- SUM() --> Returns the sum of	values within a window

-- find the total sales across all orders

SELECT 
	OrderID,
	SUM(Sales) OVER () AS tot_orders
FROM Sales.Orders;

-- find the total sales for each prodcut orders

SELECT 
	OrderID,
	ProductID,
	SUM(Sales) OVER (PARTITION BY ProductID) AS tot_orders
FROM Sales.Orders;


-- find he percentage contribution of each product's sales to the total sales


SELECT
	OrderID,
	ProductID,
	Sales,
	SUM(Sales) OVER() AS tot_sales,
	ROUND(CAST(Sales AS FLOAT) / SUM(Sales) OVER()*100,2) AS percentage
FROM Sales.Orders;


-- AVG() --> Returns the average of values	within window

-- find the average sales across all orders and average sales for each product
-- Additionally provide details such as order ID and order Date

SELECT 
	OrderID,
	OrderDate,
	AVG(NULLIF(Sales,0)) OVER() AS avG_full_window,
	AVG(NULLIF(Sales,0)) OVER(PARTITION BY ProductID) AS avG_productID
FROM Sales.Orders;


-- find the average scores of customers additionally provide details such as customerID and Last Name

SELECT 
	CustomerID,
	LastName,
	AVG(COALESCE(Score,0)) OVER () AS AVG_scores
FROM Sales.Customers;



-- find all orders where sales are higher than the average sales across all orders

SELECT 
	*
FROM
(
	SELECT 
		OrderID,
		ProductID,
		Sales,
		AVG(Sales) OVER () AS avg_sales
	FROM Sales.Orders
)t WHERE t.Sales > t.avg_sales


-- MIN() --> Returns the lowest value within a window
-- MAX() --> Returns the maximum value within a window


-- find the highest and lowest sales across all orders and the highest and lowest sales for each product
-- additionally provide detailssuch as orderID and order Date


SELECT 
	OrderID,
	OrderDate,
	MIN(Sales) OVER () entire_window_lowest,
	MAX(Sales) OVER () entire_window_highest,
	MIN(Sales) OVER (PARTITION BY ProductID) each_product_window_lowest,
	MAX(Sales) OVER (PARTITION BY ProductID) each_product_window_highest

FROM Sales.Orders;


-- show the employees with the higest salaries

SELECT 
	*
FROM(
	SELECT 
		EmployeeID,
		Salary,
		MAX(Salary) OVER () max_sal
	FROM Sales.Employees
) AS t WHERE Salary = max_sal; 


-- calculation the deviation of the each sales from both minimum and maximum sales amounts

SELECT 
	OrderID,
	OrderDate,
	Sales,
	MIN(Sales) OVER () entire_window_lowest,
	MAX(Sales) OVER () entire_window_highest,
	Sales - MIN(Sales) OVER () AS deviationFromMin,
	MAX(Sales) OVER () - Sales AS deviationFromMax 
FROM Sales.Orders;



-- calculate the moving average of sales for each products over time 

SELECT 
	OrderID,
	ProductID,
	OrderDate,
	Sales,
	AVG(Sales) OVER (PARTITION BY ProductID) AS AVG_product,
	AVG(Sales) OVER (PARTITION BY ProductID ORDER BY OrderDate) AS moving_avg
FROM Sales.Orders;

-- calculate the moving average of sales for each product over time, including only the next order

SELECT 
	OrderID,
	ProductID,
	OrderDate,
	Sales,
	AVG(Sales) OVER (PARTITION BY ProductID) AS AVG_product,
	AVG(Sales) OVER (PARTITION BY ProductID ORDER BY OrderDate ROWS BETWEEN CURRENT ROW AND 1 FOLLOWING) AS rolling_avg
FROM Sales.Orders;






















