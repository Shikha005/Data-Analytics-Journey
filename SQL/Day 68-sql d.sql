--Find the number of orders handled by each employee along with their department
SELECT 
    e.EmployeeID,
    e.EmployeeName,
    e.Department,
    COUNT(o.OrderID) AS TotalOrders
FROM employee__ e
LEFT JOIN order__ o
    ON e.EmployeeID = o.EmployeeID
GROUP BY 
    e.EmployeeID,
    e.EmployeeName,
    e.Department
ORDER BY TotalOrders DESC;

--Find customers who have never placed an order
SELECT 
    c.CustomerID,
    c.CustomerName
FROM customer__ c
LEFT JOIN order__ o
    ON c.CustomerID = o.CustomerID
WHERE o.OrderID IS NULL;