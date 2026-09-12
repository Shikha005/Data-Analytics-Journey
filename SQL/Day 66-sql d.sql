--Using customer__ and order__, find customers who have placed more than 2 orders.

--Display:Customer ID,Customer Name,Number of Orders
--Sort by the number of orders in descending order.

SELECT
    c.CustomerID,
    c.CustomerName,
    COUNT(o.OrderID) AS NumberOfOrders
FROM customer__ c
INNER JOIN order__ o
    ON c.CustomerID = o.CustomerID
GROUP BY
    c.CustomerID,
    c.CustomerName
HAVING COUNT(o.OrderID) > 2
ORDER BY NumberOfOrders DESC;