--Find customers who have placed more than 3 orders and spent more than ₹50,000.
SELECT 
    c.CustomerID,
    c.CustomerName,
    COUNT(o.OrderID) AS TotalOrders,
    SUM(o.Quantity * o.UnitPrice) AS TotalSpending
FROM customer__ c
JOIN order__ o
    ON c.CustomerID = o.CustomerID
GROUP BY c.CustomerID, c.CustomerName
HAVING COUNT(o.OrderID) > 3
   AND SUM(o.Quantity * o.UnitPrice) > 50000
ORDER BY TotalSpending DESC;

--Find the highest-selling product in each category based on quantity sold.
WITH ProductSales AS
(
    SELECT 
        p.Category,
        p.ProductID,
        p.ProductName,
        SUM(o.Quantity) AS TotalQuantity
    FROM product__ p
    JOIN order__ o
        ON p.ProductID = o.ProductID
    GROUP BY 
        p.Category,
        p.ProductID,
        p.ProductName
),
RankedProducts AS
(
    SELECT *,
        RANK() OVER (
            PARTITION BY Category 
            ORDER BY TotalQuantity DESC
        ) AS ProductRank
    FROM ProductSales
)
SELECT 
    Category,
    ProductID,
    ProductName,
    TotalQuantity
FROM RankedProducts
WHERE ProductRank = 1;