--Find employees who have handled more than 5 orders
SELECT 
    e.EmployeeID,
    e.EmployeeName,
    COUNT(o.OrderID) AS OrdersHandled
FROM employee__ e
JOIN order__ o
    ON e.EmployeeID = o.EmployeeID
GROUP BY e.EmployeeID, e.EmployeeName
HAVING COUNT(o.OrderID) > 5;

--Find the customer who has spent the highest total amount
SELECT TOP 1
    c.CustomerID,
    c.CustomerName,
    SUM(o.Quantity * p.Price) AS TotalSpent
FROM customer__ c
JOIN order__ o
    ON c.CustomerID = o.CustomerID
JOIN product__ p
    ON o.ProductID = p.ProductID
GROUP BY c.CustomerID, c.CustomerName
ORDER BY TotalSpent DESC;