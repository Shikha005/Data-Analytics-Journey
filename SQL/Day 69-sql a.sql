--Find the total revenue generated from each product.
SELECT 
    p.ProductID,
    p.ProductName,
    SUM(o.Quantity * o.UnitPrice) AS TotalRevenue
FROM product__ p
JOIN order__ o
    ON p.ProductID = o.ProductID
GROUP BY p.ProductID, p.ProductName
ORDER BY TotalRevenue DESC;

--Find the top 5 customers based on their total spending.
SELECT TOP 5
    c.CustomerID,
    c.CustomerName,
    SUM(o.Quantity * o.UnitPrice) AS TotalSpending
FROM customer__ c
JOIN order__ o
    ON c.CustomerID = o.CustomerID
GROUP BY c.CustomerID, c.CustomerName
ORDER BY TotalSpending DESC;