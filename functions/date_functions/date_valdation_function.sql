-- ISDATE() --> check if a value is a date

SELECT 
	ISDATE('123') AS check_1,
	ISDATE('2025-08-20') AS check_2,
	ISDATE('08-20-2025') AS check_3,
	ISDATE('20-08-2025')  AS check_4,
	ISDATE('2025') AS check_5,
	ISDATE('06') AS check_6
