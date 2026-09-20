--Find the top 3 customers from each city based on total spending.

WITH CustomerSpending AS
(
SELECT c.CustomerID,c.CustomerName,c.City,SUM(o.Quantity * o.UnitPrice) AS TotalSpending
FROM customer__ c INNER JOIN order__ o
ON c.CustomerID = o.CustomerID
GROUP BY
c.CustomerID,
c.CustomerName,
c.City
),
RankedCustomers AS
(
SELECT *,
DENSE_RANK() OVER (PARTITION BY City ORDER BY TotalSpending DESC) AS SpendingRank
FROM CustomerSpending
)
SELECT CustomerID,CustomerName,City,TotalSpending,SpendingRank
FROM RankedCustomers
WHERE SpendingRank <= 3
ORDER BY City, SpendingRank;