
SELECT
	em.LastName
	, o
FROM
	Employees em
LEFT JOIN
	Orders o
ON
	em.EmployeeID = o.EmployeeID
WHERE
	o.OrderID IS NULL
;