--Find the total revenue generated in each month of 2025.

SELECT MONTH(OrderDate) AS OrderMonth, SUM(Quantity * UnitPrice) AS TotalRevenue
FROM order__
WHERE YEAR(OrderDate) = 2025
GROUP BY MONTH(OrderDate)
ORDER BY OrderMonth;

--Find customers who have purchased products from more than one category.

SELECT c.CustomerID,c.CustomerName,COUNT(DISTINCT p.Category) AS CategoriesPurchased
FROM customer__ c
INNER JOIN order__ o
ON c.CustomerID = o.CustomerID
INNER JOIN product__ p
ON o.ProductID = p.ProductID
GROUP BY c.CustomerID, c.CustomerName
HAVING COUNT(DISTINCT p.Category) > 1;