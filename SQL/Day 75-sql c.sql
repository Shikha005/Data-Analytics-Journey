--Find customers whose total spending is greater than ₹50,000.

SELECT c.CustomerID,c.CustomerName,SUM(o.Quantity * o.UnitPrice) AS TotalSpending
FROM customer__ c
INNER JOIN order__ o
ON c.CustomerID = o.CustomerID
GROUP BY c.CustomerID, c.CustomerName
HAVING SUM(o.Quantity * o.UnitPrice) > 50000
ORDER BY TotalSpending DESC;

--Find the latest order placed by each customer.

WITH LatestOrders AS
(
SELECT CustomerID,OrderID,OrderDate,Quantity,
ROW_NUMBER() OVER (PARTITION BY CustomerID ORDER BY OrderDate DESC, OrderID DESC) AS rn
FROM order__
)
SELECT CustomerID,OrderID,OrderDate,Quantity
FROM LatestOrders
WHERE rn = 1;