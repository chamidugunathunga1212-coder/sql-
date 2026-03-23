-- find the total sales across all orders

SELECT 
	SUM(Sales) AS total_sales
FROM Sales.Orders;


-- find the total sales for each product

SELECT 
	ProductID,
	SUM(Sales)
FROM Sales.Orders
GROUP BY ProductID;


-- find the total sales for each product additionally provide details such as order id and order date

SELECT 
	OrderID,
	ProductID,
	OrderDate,
	SUM(Sales) OVER(PARTITION BY ProductID) AS TotalSales
FROM Sales.Orders;


-- find the total sales for each combination of product and order status additionally provide details such as order id and order date

SELECT 
	OrderID,
	ProductID,
	OrderStatus,
	OrderDate,
	SUM(Sales) OVER(PARTITION BY ProductID,OrderStatus) AS TotalSales
FROM Sales.Orders;


-- rank each order based on their sales from highest to lowest additionally provide details
-- such order id and order date

SELECT 
	OrderID,
	OrderDate,
	Sales,
	RANK() OVER(ORDER BY Sales DESC) AS ranking

FROM Sales.Orders;




-- windown function frame

SELECT 
	OrderID,
	OrderDate,
	Sales,
	SUM(Sales) OVER(PARTITION BY OrderStatus  ORDER BY OrderDate ROWS BETWEEN CURRENT ROW AND 2 FOLLOWING) AS TotalSales

FROM Sales.Orders;


-- rank customers based on their total sales

SELECT 
	CustomerID,
	SUM(Sales) AS TotSales,
	RANK() OVER (ORDER BY SUM(Sales) DESC) AS RankCustomers
FROM Sales.Orders
GROUP BY CustomerID;



