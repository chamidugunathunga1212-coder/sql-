USE MyDatabase;

-- INNER JOIN -> returns only matching rows from both tables

-- get all customers along with their orders, but only for customers who have placed an order

SELECT 
	c.id,
	c.first_name,
	c.country,
	c.score,
	o.order_id,
	o.order_date,
	o.sales
FROM customers AS c
INNER JOIN orders AS o ON c.id = o.customer_id;


-- LEFT JOIN -> return all rows from LEFT and only matching from RIGHT

-- get all customers along with their orders including those without orders

SELECT *
FROM customers c
LEFT JOIN orders o ON c.id = o.customer_id;



-- RIGHT JOIN -> return all rows from RIGHT and only matching from LEFT

-- get all customers along with their orders including orders without matching customers

SELECT *
FROM customers c
RIGHT JOIN orders o ON c.id = o.customer_id;


-- TASK -> get all customers along with their orders, including orders without matching customers

SELECT *
FROM orders o
LEFT JOIN customers c ON o.customer_id = c.id;


-- FULl JOIN -> Return all the rows from both tables

-- gel all customers and all orders even if there's no match

SELECT *
FROM customers c
FULL JOIN orders o ON c.id = o.customer_id;















