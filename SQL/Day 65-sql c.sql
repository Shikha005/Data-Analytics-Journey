--Display each employee and the total number of orders handled by them.
SELECT 
    e.EmployeeName,
    COUNT(o.OrderID) AS TotalOrders
FROM Employee__ e
LEFT JOIN Order__ o
    ON e.EmployeeID = o.EmployeeID
GROUP BY e.EmployeeName
ORDER BY TotalOrders DESC;

--Find all customers who have no orders.
SELECT 
    c.CustomerID,
    c.CustomerName
FROM Customer__ c
LEFT JOIN Order__ o
    ON c.CustomerID = o.CustomerID
WHERE o.OrderID IS NULL;