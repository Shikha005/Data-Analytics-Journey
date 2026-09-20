--Calculate the percentage contribution of each product to total revenue.

WITH ProductRevenue AS
(
SELECT p.ProductID,p.ProductName,SUM(o.Quantity * o.UnitPrice) AS Revenue
FROM product__ p INNER JOIN order__ o
ON p.ProductID = o.ProductID
GROUP BY p.ProductID,p.ProductName
)
SELECT ProductID,ProductName,Revenue,
ROUND(Revenue * 100.0 / SUM(Revenue) OVER (),2) AS RevenuePercentage
FROM ProductRevenue
ORDER BY RevenuePercentage DESC;

--Find customers who have ordered products from more than one category.

SELECT c.CustomerID, c.CustomerName,
COUNT(DISTINCT p.Category) AS CategoryCount
FROM customer__ c
INNER JOIN order__ o
ON c.CustomerID = o.CustomerID
INNER JOIN product__ p
ON o.ProductID = p.ProductID
GROUP BY c.CustomerID,c.CustomerName
HAVING COUNT(DISTINCT p.Category) > 1
ORDER BY CategoryCount DESC;