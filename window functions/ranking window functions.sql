-- ROW_NUMBER() --> assign unique number to each row

-- 1. rank the orders based on their sales from highest to lowest

SELECT 
OrderID,
Sales,
ROW_NUMBER() OVER (ORDER BY Sales DESC) AS rank
FROM Sales.Orders;
 

-- RANK() --> assigna rank to each row and handles ties.

-- 1. rank the orders based on their sales from highest to lowest

SELECT 
OrderID,
Sales,
RANK() OVER (ORDER BY Sales DESC) AS rank
FROM Sales.Orders;

-- DENSE_RANK() --> assigna rank to each row and handle ties and also it doesnt't leavs gaps in ranking

SELECT 
OrderID,
Sales,
DENSE_RANK() OVER (ORDER BY Sales DESC) AS rank
FROM Sales.Orders;



-- find the top highest sales for each product

SELECT *
FROM (
	SELECT 
	OrderID,
	ProductID,
	Sales,
	ROW_NUMBER() OVER(PARTITION BY ProductID ORDER BY Sales DESC) AS RankByProduct
	FROM Sales.Orders
) AS t
WHERE RankByProduct = 1;


-- find the lowest 2 customers based on their total sales
SELECT *
FROM 
(
	SELECT 
	CustomerID,
	SUM(Sales) AS TotalSales,
	ROW_NUMBER() OVER(ORDER BY SUM(Sales)) AS RankCustomers
	FROM Sales.Orders
	GROUP BY CustomerID
) AS t 
WHERE RankCustomers <= 2;



-- assign unique IDs to the rows of the 'orders archive' table

SELECT 
	ROW_NUMBER() OVER (ORDER BY OrderID,OrderDate) AS UniqueID,
	*
FROM Sales.OrdersArchive;

-- identify duplicate rows in the table	'order archive' and return a clean result withput any duplicates

SELECT *
FROM (
	SELECT 
	ROW_NUMBER() OVER (PARTITION BY OrderID ORDER BY CreationTime DESC) AS rn,
	*
	FROM Sales.OrdersArchive
) AS t
WHERE t.rn =1




-- NTILE() --> devides te rows into a specified number of approximately equal groups

SELECT 
OrderID,
Sales,
NTILE(1) OVER (ORDER BY Sales DESC) AS ntile_rank_1,
NTILE(2) OVER (ORDER BY Sales DESC) AS ntile_rank_2
FROM Sales.Orders;

-- usecase --> data segmentation

-- segment all orders into 3 categories high,medium and low sales
SELECT 
*,
CASE 
	WHEN t.Buckets = 1 THEN 'High'
	WHEN t.Buckets = 2 THEN 'Medium'
	WHEN t.Buckets = 3 THEN 'Low'
END AS SalesSegments
FROM(
	SELECT 
		OrderID,
		Sales,
		NTILE(3) OVER(ORDER BY Sales DESC) AS Buckets
	FROM Sales.Orders
) AS t

-- Equalizing load

-- inorder to export the data divide the orders into 2 groups

SELECT 
NTILE(2) OVER (ORDER BY OrderID) AS Buckets,
*
FROM Sales.Orders;











