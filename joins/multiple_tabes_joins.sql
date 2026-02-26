USE SalesDB;


/* Using SalesDB retrieve a list of all orders , along with the related customer,product 
and enmployee details */

SELECT 
	o.OrderID,
	c.FirstName AS customer_name,
	p.Product AS product_name,
	o.Sales AS sales_amount,
	p.Price AS product_price,
	e.FirstName	AS sales_person_names

FROM Sales.Orders AS o
LEFT JOIN Sales.Customers AS c ON o.CustomerID = c.CustomerID
LEFT JOIN Sales.Products AS p ON o.ProductID = p.ProductID
LEFT JOIN Sales.Employees AS e ON o.SalesPersonID = e.EmployeeID;
