-- find the total number of orders 

SELECT COUNT(OrderID) AS orderCount
FROM Sales.Orders;


-- find the total sales of all orders

SELECT SUM(Sales) AS tot_sales
FROM Sales.Orders;

-- find the average sales of all orders

SELECT AVG(Sales) AS tot_sales
FROM Sales.Orders;

-- find the highest score among customers

SELECT 
	MAX(Score) AS max_value
FROM Sales.Customers;


-- find the lowest score among customers

SELECT 
	MIN(Score) AS max_value
FROM Sales.Customers;





