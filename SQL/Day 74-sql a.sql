--Find the total number of orders and total quantity sold for each product.

SELECT p.ProductID,p.ProductName,COUNT(o.OrderID) AS TotalOrders,SUM(o.Quantity) AS TotalQuantitySold
FROM product__ p INNER JOIN order__ o
ON p.ProductID = o.ProductID
GROUP BY p.ProductID, p.ProductName
ORDER BY TotalQuantitySold DESC;

--Find customers who have never placed an order.

SELECT c.CustomerID,c.CustomerName,c.City
FROM customer__ c LEFT JOIN order__ o
ON c.CustomerID = o.CustomerID
WHERE o.OrderID IS NULL;