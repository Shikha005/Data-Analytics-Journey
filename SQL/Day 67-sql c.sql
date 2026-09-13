--Display Customer ID, Customer Name, and Total Purchase Amount. Calculate the amount as Quantity × ProductPrice. Show customers whose total purchase amount is greater than ₹10,000.
SELECT
    c.CustomerID,
    c.CustomerName,
    SUM(o.Quantity * p.ProductPrice) AS TotalPurchaseAmount
FROM customer__ c
INNER JOIN order__ o
    ON c.CustomerID = o.CustomerID
INNER JOIN product__ p
    ON o.ProductID = p.ProductID
GROUP BY
    c.CustomerID,
    c.CustomerName
HAVING SUM(o.Quantity * p.ProductPrice) > 10000
ORDER BY TotalPurchaseAmount DESC;