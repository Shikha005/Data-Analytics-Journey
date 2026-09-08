--Delete all orders whose status is Cancelled and whose amount is less than ₹1,000.

DELETE FROM order__
WHERE Status = 'Cancelled'
AND Amount < 1000;

--Reduce the stock of each product by 1 for products that have at least one order.

UPDATE p
SET p.Stock = p.Stock - 1
FROM product__ p
WHERE p.ProductID IN (
    SELECT DISTINCT ProductID
    FROM order__
);