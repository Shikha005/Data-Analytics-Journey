--Display each customer name and the total number of orders they have placed.
SELECT
    c.CustomerName,
    COUNT(o.OrderID) AS Total_Orders
FROM customer__ c
LEFT JOIN order__ o
    ON c.CustomerID = o.CustomerID
GROUP BY c.CustomerName;

--Display each customer and their highest order amount.
SELECT
    c.CustomerName,
    MAX(o.Amount) AS Highest_Order
FROM customer__ c
JOIN order__ o
    ON c.CustomerID = o.CustomerID
GROUP BY c.CustomerName;