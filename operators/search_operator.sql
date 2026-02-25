-- Like operator -> search for a pattern in text

-- find all customers whose first name starts with 'M'

SELECT *
FROM customers
WHERE first_name LIKE 'M%';

-- find all customers whose first name ends with 'n'

SELECT * 
FROM customers
WHERE first_name LIKE '%n';


-- find all customers whose first name contains 'r'

SELECT *
FROM customers
WHERE first_name LIKE '%r%';

-- find all customers whose first name has 'r' in the third position

SELECT *
FROM customers
WHERE first_name LIKE '__r%';

