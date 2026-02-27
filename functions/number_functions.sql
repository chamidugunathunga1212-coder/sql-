-- ROUND -> ROUND the values decimal points

SELECT 
	3.516,
	ROUND(3.516,2) AS round_2,
	ROUND(3.516,1) AS round_1,
	ROUND(3.516,0) AS round_0

-- ABS FUNCTION -> convert any negative number to positive number

SELECT
	-4,
	ABS(-4) AS positive_number,
	ABS(10)
