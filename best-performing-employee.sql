
/*
SELECT 
	e.employeeID
	, e.LastName
	, e.FirstName
	,best_em.total_products_per_employee
FROM Employees e
INNER JOIN
		(
		SELECT 
			EmployeeID
			, SUM(product_quantity_per_order) AS total_products_per_employee
		FROM
			(SELECT
				o.EmployeeID
				, od.product_quantity_per_order
			FROM
				Orders o
			INNER JOIN
				(
				SELECT 
					OrderID
				    , SUM(Quantity) AS product_quantity_per_order
				FROM 
					OrderDetails
				GROUP BY 
					OrderID 
				) od
			ON
				o.OrderID = od.OrderID)
		GROUP BY
			EmployeeID
		ORDER BY 
			total_products_per_employee DESC
		LIMIT 1
		) AS best_em
ON
	e.EmployeeID=best_em.EmployeeID
;
*/

-- Dai's query

SELECT
	o.EmployeeID
	, em.FirstName
	, em.LastName
	, SUM(od.Quantity) total_products_sold
FROM
	Orders o
JOIN
	OrderDetails od
ON 
	o.OrderID = od.OrderID
JOIN
	Employees em
ON 
	o.EmployeeID = em.EmployeeID
GROUP BY
	o.EmployeeID
ORDER BY
	SUM(od.Quantity) desc
LIMIT 100;
