select * from order__
select * from customer__
select * from employee__
select * from product__

--Display the order details along with the customer name.
SELECT 
    o.OrderID,
    c.CustomerName,
    o.OrderDate
FROM Order__ o
JOIN Customer__ c
    ON o.CustomerID = c.CustomerID;

--Display each customer and the total number of orders they have placed.
SELECT 
    c.CustomerName,
    COUNT(o.OrderID) AS TotalOrders
FROM Customer__ c
LEFT JOIN Order__ o
    ON c.CustomerID = o.CustomerID
GROUP BY c.CustomerName
ORDER BY TotalOrders DESC;

--Display the customer name and number of orders for customers who placed more than 2 orders.
SELECT 
    c.CustomerName,
    COUNT(o.OrderID) AS TotalOrders
FROM Customer__ c
JOIN Order__ o
    ON c.CustomerID = o.CustomerID
GROUP BY c.CustomerName
HAVING COUNT(o.OrderID) > 2;