-- ISNULL() -> Replace 'NULL' with specific value

-- COALESCE() -> Returns the first non null value from a list


-- handle the NULL before doing data aggregations

-- 1. find the average scores of the customer

SELECT 
	CustomerID,
	score,
	COALESCE(Score,0),
	AVG(Score) OVER () AvgScores,
	AVG(COALESCE(Score,0)) OVER () AvgScores2
FROM Sales.Customers;


-- 2. display the full name of customers in a single field by merging their first name and last names
-- and add 10 bonus points to each customer's score


SELECT 
	CustomerID,
	FirstName,
	LastName,
	COALESCE(LastName,''),
	FirstName+ ' ' +COALESCE(LastName,'') AS fullName,
	Score,
	COALESCE(Score,0) + 10 AS bonus
FROM Sales.Customers;



-- 3. handles nulls in the joins

-- 4 . sort the customers from lowest to highest scores, with NULLs appearing last

SELECT 
	CustomerID,
	Score,
	CASE
		WHEN score 	IS NULL THEN 1 
		ELSE 0
	END AS Flag
FROM Sales.Customers
ORDER BY 	
	CASE
		WHEN score 	IS NULL THEN 1 
		ELSE 0
	END,
	Score;



	-- NULLIF() - compares two expressions returns: NULL -> if they are equal , first value -> if they are not equal

	-- use case 1

	-- preventing the error of dividing by zero

	-- 1. find the sales price for each order by divinding the sales by the quantity

	SELECT 
		OrderID,
		Sales,
		Quantity,
		Sales/NULLIF(Quantity,0) AS price
	FROM Sales.Orders;




	-- ISNULL() -> Returns TRUE is value IS NULL otherwise it returns FALSE

	-- IS NOT NULL -> Returns TRUE if the value IS NOT NULL otherwise it returns FALSE

	-- filtering data --> usercase

	-- 1. Identify the customers who have no scores


	SELECT 
		CustomerID,
		Score
	FROM Sales.Customers
	WHERE Score IS NULL;


	-- 2.List all customers who have scores


	SELECT 
		CustomerID,
		Score
	FROM Sales.Customers
	WHERE Score IS NOT NULL;

-- IS NULL use case --> finding the unmatched rows between two tables

	-- 1. LEFT ANTI JOIN
	-- 2. RIGHT ANTI JOIN


	-- 1. List all details for customers who have not placed any orders

	SELECT 
		c.*,
		o.OrderID
	FROM Sales.Customers c
	LEFT JOIN Sales.Orders o ON c.CustomerID = o.OrderID
	WHERE o.CustomerID IS NULL






