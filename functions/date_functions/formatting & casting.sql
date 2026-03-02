-- FORMATTING -> Changing the format of a value from one to another

-- CASTING -> Changing the data type from one to another

-- 1. FORMAT() --> format date and time value

SELECT 
	OrderID,
	CreationTime,
	FORMAT(CreationTime,'dd') AS dd,
	FORMAT(CreationTime,'ddd') AS ddd,
	FORMAT(CreationTime,'dddd') AS dddd,
	FORMAT(CreationTime,'MM') AS MM,
	FORMAT(CreationTime,'MMM') AS MMM,
	FORMAT(CreationTime,'MMMM') AS MMMM
FROM Sales.Orders;

-- usa format
SELECT 
	OrderID,
	CreationTime,
	FORMAT(CreationTime,'MM-dd-yyyy') AS usa_format
FROM Sales.Orders;


-- europe format
SELECT 
	OrderID,
	CreationTime,
	FORMAT(CreationTime,'dd-MM-yyyy') AS europe_format
FROM Sales.Orders;


-- Task --> show CreationTime using the following format 'Day Wed Jan Q1 2025 12:34:56 PM'
SELECT 
	OrderID,
	CreationTime,
	'Day '+ FORMAT(CreationTime,'ddd MMM')+' Q'+DATENAME(QUARTER,CreationTime)+' '+FORMAT(CreationTime,'yyyy hh:mm:ss tt') 
	AS custome_date
FROM Sales.Orders;



-- formatting usecase 
-- 1. data aggregations

SELECT 
	FORMAT(OrderDate,'MMM yy'),
	COUNT(*)
FROM Sales.Orders
GROUP BY FORMAT(OrderDate,'MMM yy');

-- 2. data standardization



-- 2. CONVERT() --> converts a date or time value to different data type

SELECT 
CONVERT(INT,'123') AS string_to_int,
CONVERT(DATE,'2025-2-23') AS string_to_date,
CONVERT(DATE,CreationTime) AS datetime_to_date,
CONVERT(VARCHAR,CreationTime,32) AS datetime_to_varchar_USA_Format,
CONVERT(VARCHAR,CreationTime,34) AS datetime_to_varchar_EURO_Format
FROM Sales.Orders;


-- 3. CAST() --> Convert a value to a specified data type

SELECT
CAST('123' AS INT) AS string_int,
CAST('2025-12-06' AS DaTETIME2) AS date_to_datetime, 
CAST(CreationTime AS DATE) AS covert_daate
FROM Sales.Orders

 
