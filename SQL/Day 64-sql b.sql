--Find customers whose total spending is greater than 5000.
SELECT
    c.CustomerName,
    SUM(o.Amount) AS Total_Spending
FROM customer__ c
JOIN order__ o
    ON c.CustomerID = o.CustomerID
GROUP BY c.CustomerName
HAVING SUM(o.Amount) > 5000;

--Display the product having the highest price.
SELECT TOP 1
    ProductName,
    Category,
    Price
FROM product__
ORDER BY Price DESC;

--Display products whose stock is less than 20.
SELECT
    ProductName,
    Category,
    Price,
    Stock
FROM product__
WHERE Stock < 20;