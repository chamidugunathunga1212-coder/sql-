USE SalesDB;

-- CONCAT -> combines multiple string into one

-- concatenate firstname and country into one column

SELECT 
	*,
	CONCAT(FirstName,' ',Country) AS name_country
FROM Sales.Customers;


-- UPPER -> converts all characters to Uppercase

-- convert the first name to UPPERCASE

SELECT
	FirstName,
	UPPER(FirstName) AS upper_name
FROM Sales.Customers;



-- LOWER -> converts all characters to Lowecase

-- convert the first name to LOWERCASE

SELECT
	FirstName,
	LOWER(FirstName) AS lower_name
FROM Sales.Customers;




-- TRIM -> removes leading and trailing spaces

-- find the customers whose first name contains leading or trailing spaces

-- option 1
SELECT 
	FirstName
FROM Sales.Customers
WHERE FirstName != TRIM(FirstName);

-- option 2

SELECT 
	FirstName,
	LEN(FirstName) AS len_first_name,
	LEN(TRIM(FirstName)) AS trim_first_name,
	LEN(FirstName) - LEN(TRIM(FirstName)) AS flag

FROM Sales.Customers
WHERE LEN(FirstName) != LEN(TRIM(FirstName));



-- REPLACE -> replace specific character with a new character

-- remove dashes from a phone number

SELECT 
	'123-2456-789' AS phone_number,
	REPLACE('123-2456-789','-','') AS new_phone_number

-- replace the file extence from txt to csv

SELECT 
	'file.txt' AS txt_file,
	REPLACE('file.txt','.txt','.csv') AS csv_file


-- LEN -> count how many characters

-- calculate the length of each customer's first name

SELECT 
	FirstName,
	LEN(FirstName) AS len_name
FROM Sales.Customers;


-- LEFT and RIGHT

-- LEFT -> Exracts specific number of characters from the start

-- retrieve the first two characters of each first name

SELECT 
	FirstName,
	LEFT(FirstName,2) AS first_two
FROM Sales.Customers;


-- RIGHT -> Exracts specific number of characters from the end

-- retrieve the last two characters of each first name

SELECT 
	FirstName,
	RIGHT(FirstName,2) AS last_two
FROM Sales.Customers;


-- SUBSTRING -> extracts a part of string at a specified position

-- retrieve a list odf customers's first names removing the first character

SELECT 
	FirstName,
	SUBSTRING(TRIM(FirstName),2,LEN(FirstName)) AS substring_col
FROM Sales.Customers;
