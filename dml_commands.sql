/* DML */

-- INSERT

INSERT INTO customers (id,first_name,country,score)
VALUES
	   (6,'chamidu','sri lanka',89),
	   (7,'dewmi','USA',NULL);

SELECT * FROM customers


-- copy the data from customers table into persons

CREATE TABLE person (
	id INT,
	person_name VARCHAR(50) NOT NULL,
	birth_date DATE,
	phone VARCHAR(15) NOT NULL,

	CONSTRAINT persons_pk PRIMARY KEY (id)
);

INSERT INTO person (
	id,
	person_name,
	birth_date,
	phone
)

SELECT 
	id,
	first_name,
	NULL,
	'Unknown'
FROM customers


SELECT * FROM person;


-- UPDATE

-- change the score of customer with id 6 to 0

UPDATE customers
SET score = 0
WHERE id = 6;

SELECT * 
FROM customers;

-- change the score of customer with id 10 to 0 and update the country to uk

UPDATE customers
SET score = 0,
	country = 'UK'
WHERE id = 7;

SELECT * FROM customers;

-- update all customers with a null score by setting their score to 0 

UPDATE customers
SET score = 0
WHERE score IS NULL;

SELECT * FROM customers;


-- DELETE


-- delete all customers with an id greater than 5

DELETE FROM customers
WHERE id > 5 ;

SELECT * 
FROM customers;



-- delete all data from person
-- 1.
TRUNCATE TABLE person -- best way

-- 2.
DELETE FROM person;

SELECT *
FROM person;
