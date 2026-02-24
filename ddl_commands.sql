
/* DDL commands used to define the structure of the database */

/* Create the table called persons with columns: id,person_name,birth_date and phone */

USE MyDatabase;

-- CREATE

CREATE TABLE persons(
	id INT NOT NULL,
	person_name VARCHAR(15) NOT NULL,
	birth_date DATE,
	phone VARCHAR(10) NOT NULL,

	CONSTRAINT pk_persons PRIMARY KEY (id)

);

-- ALTER -> used to changed the definition of the table 

-- Add new column called email to the persons table

ALTER TABLE persons
ADD email VARCHAR(25) NOT NULL;


SELECT * FROM persons;


-- Remove the column phone from he persons table

ALTER TABLE persons
DROP COLUMN  phone;


SELECT * FROM persons;


-- DROP 

-- delete the table persons from the database

DROP TABLE persons;
