-- LEAD() --> access a value from the next tow within a window

-- LAG() --> access a value from the previous row within a window

-- 1. Analyze the month-over -month performance by finding the percentage change in sales between
--    current and previous month

SELECT 
	*,
	t.current_month_sales - t.previous_month_sales AS mom_change,
	ROUND(CAST((t.current_month_sales - t.previous_month_sales) AS FLOAT) / t.previous_month_sales * 100,1) AS mom_change_percentage 
FROM (
	SELECT 
		MONTH(OrderDate) AS order_month,
		SUM(Sales) AS current_month_sales,
		LAG(SUM(Sales)) OVER (ORDER BY MONTH(OrderDate)) AS previous_month_sales
	FROM Sales.Orders
	GROUP BY MONTH(OrderDate)
) AS t



-- in order to analyze customer loyalty rank customers based on the average days between their orders

SELECT 
	t.CustomerID,
	AVG(t.days_until_next_order) AS avg_dates,
	RANK() OVER (ORDER BY AVG(t.days_until_next_order) )
FROM (

	SELECT 
		OrderID,
		CustomerID,
		OrderDate AS current_order_date,
		LEAD(OrderDate) OVER(PARTITION BY CustomerID ORDER BY OrderDate) AS next_order_date,
		DATEDIFF(DAY,OrderDate,LEAD(OrderDate) OVER(PARTITION BY CustomerID ORDER BY OrderDate)) AS days_until_next_order
	FROM Sales.Orders
) AS t
GROUP BY t.CustomerID
HAVING AVG(t.days_until_next_order) IS NOT NULL


-- FIRST_VALUE() --> access a value from the first row within a window

-- LAST_VALUE() --> access a value from the last row within a window


-- find the lowest and highest sales for each product
-- find the diffrence in sales between the current and the lowest sales

SELECT
	OrderID,
	ProductID,
	Sales,
	FIRST_VALUE(Sales) OVER (PARTITION BY ProductID ORDER BY Sales) AS lowest_sales,
	LAST_VALUE(Sales) OVER (PARTITION BY ProductID ORDER BY Sales ROWS BETWEEN CURRENT ROW AND UNBOUNDED FOLLOWING) AS highest_sales,
	Sales - FIRST_VALUE(Sales) OVER (PARTITION BY ProductID ORDER BY Sales) AS diff
FROM Sales.Orders;
