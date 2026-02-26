USE SalesDB;

-- SET operator -> set operator in sql combine the result of multiple queries into a single result set

-- UNION -> Return all distinct rows from both queries

-- combine the data from employees and customers into one table
-- UNION do not allow the duplicate raws

SELECT 
	FirstName,
	LastName
FROM Sales.Customers

UNION

SELECT 
	FirstName,
	LastName
FROM Sales.Employees



-- UNION ALL -> return all rows from both tables including the duplicates

-- combine the data from employees and customers into one table including duplicates


SELECT 
	FirstName,
	LastName
FROM Sales.Customers

UNION ALL

SELECT 
	FirstName,
	LastName
FROM Sales.Employees


-- EXCEPT

-- Return all distinct rows from the first query that are not found in the second query

-- find the employees who are not customers at the same time

SELECT 
	FirstName,
	LastName
FROM Sales.Employees

EXCEPT

SELECT 
	FirstName,
	LastName
FROM Sales.Customers


-- INTERSECT -> returns only the rows that are common in the both queries

-- find the employees who are customers at the same time

SELECT 
	FirstName,
	LastName
FROM Sales.Employees

INTERSECT

SELECT 
	FirstName,
	LastName
FROM Sales.Customers



-- TASK -> orders are stored in the separate tables (orders and ordersArchive) combine all orders into 
--         into one report without duplicates

SELECT 
       'Orders' AS SourceTable,
	   [OrderID]
      ,[ProductID]
      ,[CustomerID]
      ,[SalesPersonID]
      ,[OrderDate]
      ,[ShipDate]
      ,[OrderStatus]
      ,[ShipAddress]
      ,[BillAddress]
      ,[Quantity]
      ,[Sales]
      ,[CreationTime]
FROM Sales.Orders

UNION

SELECT 
       'Orders Archive' AS SourceTable,
	   [OrderID]
      ,[ProductID]
      ,[CustomerID]
      ,[SalesPersonID]
      ,[OrderDate]
      ,[ShipDate]
      ,[OrderStatus]
      ,[ShipAddress]
      ,[BillAddress]
      ,[Quantity]
      ,[Sales]
      ,[CreationTime]
FROM Sales.OrdersArchive 

ORDER BY OrderID;
