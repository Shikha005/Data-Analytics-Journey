--Find the employee with the highest total sales amount.

SELECT TOP 1 e.EmployeeID,e.EmployeeName,e.Department,SUM(o.Quantity * o.UnitPrice) AS TotalSales
FROM employee__ e
INNER JOIN order__ o
ON e.EmployeeID = o.EmployeeID
GROUP BY e.EmployeeID, e.EmployeeName, e.Department
ORDER BY TotalSales DESC;

--Find products whose selling price is greater than the average price of their category.

SELECT p.ProductID,p.ProductName,p.Category,p.Price
FROM product__ p
WHERE p.Price > (SELECT AVG(p2.Price) FROM product__ p2 WHERE p2.Category = p.Category)
ORDER BY p.Category, p.Price DESC;