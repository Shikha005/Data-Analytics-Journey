--Find the total discount amount given on each order.

SELECT OrderID,CustomerID,Quantity,UnitPrice,DiscountPercent,
ROUND(Quantity * UnitPrice * DiscountPercent / 100.0,2) AS DiscountAmount
FROM order__
ORDER BY DiscountAmount DESC;

--Find the products that have never been ordered.

SELECT p.ProductID,p.ProductName,p.Category,p.StockQuantity
FROM product__ p
LEFT JOIN order__ o ON p.ProductID = o.ProductID
WHERE o.OrderID IS NULL;