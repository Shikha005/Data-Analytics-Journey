--Display Customer Name and Product Name for products purchased by each customer. Show only products where the product price is greater than ₹5,000.
SELECT DISTINCT
    c.CustomerName,
    p.ProductName,
    p.ProductPrice
FROM customer__ c
INNER JOIN order__ o
    ON c.CustomerID = o.CustomerID
INNER JOIN product__ p
    ON o.ProductID = p.ProductID
WHERE p.ProductPrice > 5000
ORDER BY p.ProductPrice DESC;