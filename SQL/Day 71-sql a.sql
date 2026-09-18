select * from customer__
select * from employee__
select * from product__
select * from order__

--Find all orders where quantity is greater than 5. Display OrderID, ProductID and Quantity.
WITH order_cte AS
(
    SELECT OrderID, ProductID, Quantity
    FROM order__
    WHERE Quantity > 5
)
SELECT *
FROM order_cte;

