--Find the total number of orders placed by each customer
SELECT 
    c.CustomerID,
    c.CustomerName,
    COUNT(o.OrderID) AS TotalOrders
FROM customer__ c
LEFT JOIN order__ o
    ON c.CustomerID = o.CustomerID
GROUP BY c.CustomerID, c.CustomerName;

--Find customers who have placed more than 3 orders
SELECT 
    c.CustomerID,
    c.CustomerName,
    COUNT(o.OrderID) AS TotalOrders
FROM customer__ c
JOIN order__ o
    ON c.CustomerID = o.CustomerID
GROUP BY c.CustomerID, c.CustomerName
HAVING COUNT(o.OrderID) > 3;