-- case statement --> evaluates a list of conditions and returns a value when the first condition is met

-- usecase 1 --> aggeregate and derived column

-- 1. Generate a report showing the total sale for each category
		-- High:  If the sales higher than 50
		-- Medium: If the sales between 20 an 50
		-- Low: If the sales equal or lower than 20


	-- sort the result from lowest to highest
SELECT 
category,
SUM(Sales) AS totSales
FROM (

	SELECT 
		OrderID,
		Sales,
		CASE
			WHEN Sales>50 THEN 'High'
			WHEN Sales > 20 AND Sales <= 50 THEN 'Medium'
			WHEN Sales <= 20 THEN 'Low'
		END AS category
	FROM Sales.Orders 

)t
GROUP BY category
ORDER BY totSales DESC



-- usecase 2 --> mapping the values

-- transform the values from one form to another

-- 2. retrieve employee details with gender displayed as full test

SELECT 
	EmployeeID,
	FirstName ,
	LastName,
	CASE
		WHEN Gender='M' THEN 'Male'
		WHEN Gender='F' THEN 'Female'
		ELSE 'N\A'
	END AS Gender
FROM Sales.Employees


-- 3. Retrieve customers details with abbreviated code 

SELECT 
	CustomerID,
	FirstName ,
	LastName,
	Country,
	CASE
		WHEN Country = 'Germany' THEN 'DE'
		WHEN Country = 'USA' THEN 'US'
		ELSE 'N/A'
	END AS code
FROM Sales.Customers



-- 4. Handling Null values --> replace nulls with a specific value

-- find the average scores of customers and treat Nulls as 0
-- and additional provide details such and customerID & LastName

SELECT	
	CustomerID,
	LastName,

	AVG(
		CASE
			WHEN Score IS NULL THEN 0
			ELSE Score
		END) OVER() AvgCustomer
FROM Sales.Customers




-- usecase 4 --> conditional aggregation

-- apply aggregate fuctions only on subset of data that fulfill certain condition


-- count how many times each customer has made an order with sales greater than 30



SELECT 

	CustomerID,
	SUM(CASE
		WHEN Sales > 30 THEN 1
		ELSE 0
	END) AS highSales,
	COUNT(*) AS totalSaleCount
FROM Sales.Orders
GROUP BY CustomerID
ORDER BY CustomerID 













