USE MyDatabase;


-- operator -> =  

-- Retrieve all customers from Germany

SELECT * 
FROM customers
WHERE country = 'Germany';


-- operator -> <> , != 

-- Retrieve all customers who are not from Germany

SELECT * 
FROM customers
WHERE country != 'Germany';


-- operator -> >

-- Retrieve all customers with a score greater than 500

SELECT * 
FROM customers
WHERE score > 500;


-- operator -> >= 

-- Retrieve all customers with a score 500 or more

SELECT * 
FROM customers
WHERE score >= 500;

-- operator -> >

-- Retrieve all customers with a score less than 500

SELECT * 
FROM customers
WHERE score < 500;


-- operator -> <= 

-- Retrieve all customers with a score 500 or less

SELECT * 
FROM customers
WHERE score <= 500;





