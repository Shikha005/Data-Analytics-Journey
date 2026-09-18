select * from customer__
select * from employee__
select * from product__
select * from order__

--Find customers whose total spending is greater than the average spending of all customers. Display customer name and total spending.

;WITH CustomerSpending AS
(
SELECT c.CustomerID,c.CustomerName,SUM(o.Quantity * o.UnitPrice) AS TotalSpending
FROM customer__ c JOIN order__ o
ON c.CustomerID = o.CustomerID
GROUP BY c.CustomerID, c.CustomerName
)
SELECT CustomerID,CustomerName,TotalSpending
FROM CustomerSpending
WHERE TotalSpending >(SELECT AVG(TotalSpending)FROM CustomerSpending)
ORDER BY TotalSpending DESC;

--Find the second-highest priced product in each category. Display category, product name, and price.

WITH RankedProducts AS
(
SELECT ProductID,ProductName,Category,Price,
DENSE_RANK() OVER (PARTITION BY Category ORDER BY Price DESC) AS PriceRank
FROM product__)
SELECT ProductID,ProductName,Category,Price
FROM RankedProducts
WHERE PriceRank = 2;
