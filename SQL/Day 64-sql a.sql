--Find the customer name, order ID, order date, and amount for every order.

SELECT
    c.CustomerName,
    o.OrderID,
    o.OrderDate,
    o.Amount
FROM customer__ c
JOIN order__ o
    ON c.CustomerID = o.CustomerID;

--Find the product name, category, and amount for each order
SELECT
    p.ProductName,
    p.Category,
    o.Amount
FROM product__ p
JOIN order__ o
    ON p.ProductID = o.ProductID;

--Display each customer and their total amount spent.
SELECT
    c.CustomerName,
    SUM(o.Amount) AS Total_Spending
FROM customer__ c
JOIN order__ o
    ON c.CustomerID = o.CustomerID
GROUP BY c.CustomerName;