--Display customer name, product name, and amount for orders whose status is 'Completed'
SELECT
    c.CustomerName,
    p.ProductName,
    o.Amount
FROM customer__ c
JOIN order__ o
    ON c.CustomerID = o.CustomerID
JOIN product__ p
    ON o.ProductID = p.ProductID
WHERE o.Status = 'Completed';

--Rank customers based on their total spending, with the highest spender getting rank 1.
SELECT
    c.CustomerName,
    SUM(o.Amount) AS Total_Spending,
    RANK() OVER (
        ORDER BY SUM(o.Amount) DESC
    ) AS Spending_Rank
FROM customer__ c
JOIN order__ o
    ON c.CustomerID = o.CustomerID
GROUP BY c.CustomerName;