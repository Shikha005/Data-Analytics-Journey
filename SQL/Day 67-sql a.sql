--Display the Customer ID, Customer Name, and total number of orders for each customer. Include only customers who have placed at least 2 orders.
SELECT
    c.CustomerID,
    c.CustomerName,
    COUNT(o.OrderID) AS TotalOrders
FROM customer__ c
INNER JOIN order__ o
    ON c.CustomerID = o.CustomerID
GROUP BY
    c.CustomerID,
    c.CustomerName
HAVING COUNT(o.OrderID) >= 2
ORDER BY TotalOrders DESC;

--Display the Product ID, Product Name, and total quantity sold for each product. Show only products where the total quantity sold is greater than 10.
SELECT
    p.ProductID,
    p.ProductName,
    SUM(o.Quantity) AS TotalQuantitySold
FROM product__ p
INNER JOIN order__ o
    ON p.ProductID = o.ProductID
GROUP BY
    p.ProductID,
    p.ProductName
HAVING SUM(o.Quantity) > 10
ORDER BY TotalQuantitySold DESC;