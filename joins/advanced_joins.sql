USE MyDatabase;

-- LEFT ANTI JOIN -> Return row from LEFT that has no match in RIGHT

-- get all customers who havent't placed any order

SELECT *
FROM customers c
LEFT JOIN orders o ON c.id = o.customer_id
WHERE o.order_id IS NULL;


-- RIGHT ANTI JOIN -> Return rows from RIGHT that has NO MATCH in left

-- Get all orders without matching customers
SELECT * 
FROM customers AS c
RIGHT JOIN orders AS o ON c.id =o.customer_id
WHERE c.id IS NULL;


-- Get all orders without matching customers using LEFT JOIN

SELECT *
FROM orders AS o
LEFT JOIN customers AS c ON o.customer_id = c.id
WHERE c.id IS NULL;


-- FULL ANTI JOIN -> reurns only rows that dont't match in either tables

-- find customers without orders and orders without customers

SELECT *
FROM customers AS c
FULL JOIN orders AS o ON c.id = o.customer_id
WHERE c.id IS NULL OR o.order_id IS NULL;



/* Get all customers along with their orders but only for customers who have placed an order */

-- option 1 -> with inner join
SELECT *
FROM customers AS c
INNER JOIN orders As o ON c.id = o.customer_id;

-- option 2 -> without inner join

SELECT *
FROM customers AS c
LEFT JOIN orders AS o ON c.id = o.customer_id
WHERE o.order_id IS NOT NUlL;


-- CROSS JOIN -> combines the every row from left with every row from the right


-- Genarate all possibale combinations of customers and orders

SELECT * 
FROM customers
CROSS JOIN orders;
