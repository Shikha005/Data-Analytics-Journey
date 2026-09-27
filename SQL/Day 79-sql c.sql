--Find the customer who purchased the highest total quantity

SELECT TOP 1 c.customerid,c.customername,
SUM(o.quantity) AS total_quantity
FROM customer__ c JOIN order__ o
ON c.customerid = o.customerid
GROUP BY c.customerid, c.customername
ORDER BY total_quantity DESC;

--Find orders where the quantity is greater than the average order quantity

SELECT orderid,customerid,productid,quantity
FROM order__
WHERE quantity > (SELECT AVG(quantity) FROM order__);