--Display Employee ID, Employee Name, and the number of orders handled by each employee. Show only employees who handled more than 5 orders.
SELECT
    e.EmployeeID,
    e.EmployeeName,
    COUNT(o.OrderID) AS TotalOrders
FROM employee__ e
INNER JOIN order__ o
    ON e.EmployeeID = o.EmployeeID
GROUP BY
    e.EmployeeID,
    e.EmployeeName
HAVING COUNT(o.OrderID) > 5
ORDER BY TotalOrders DESC;

--Display Customer Name, Product Name, and the total quantity purchased by each customer for each product.
SELECT
    c.CustomerName,
    p.ProductName,
    SUM(o.Quantity) AS TotalQuantity
FROM customer__ c
INNER JOIN order__ o
    ON c.CustomerID = o.CustomerID
INNER JOIN product__ p
    ON o.ProductID = p.ProductID
GROUP BY
    c.CustomerName,
    p.ProductName
ORDER BY
    c.CustomerName,
    TotalQuantity DESC;