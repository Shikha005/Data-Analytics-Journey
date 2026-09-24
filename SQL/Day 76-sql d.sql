--Calculate the percentage contribution of each product to total revenue.

SELECT p.ProductID,p.ProductName,
SUM(o.Quantity * o.UnitPrice) AS ProductRevenue,
ROUND(SUM(o.Quantity * o.UnitPrice) * 100.0 /
SUM(SUM(o.Quantity * o.UnitPrice)) OVER (),2) AS RevenuePercentage
FROM product__ p
INNER JOIN order__ o
ON p.ProductID = o.ProductID
GROUP BY p.ProductID, p.ProductName
ORDER BY RevenuePercentage DESC;

--Find the second order of every customer based on order date.

WITH CustomerOrders AS
(
SELECT CustomerID,OrderID,OrderDate,
ROW_NUMBER() OVER (PARTITION BY CustomerID ORDER BY OrderDate) AS OrderNumber
FROM order__
)
SELECT CustomerID, OrderID,OrderDate
FROM CustomerOrders
WHERE OrderNumber = 2
ORDER BY CustomerID;