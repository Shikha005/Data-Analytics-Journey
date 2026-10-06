--Find the total number of orders for each product category

SELECT p.category,COUNT(o.orderid) AS total_orders
FROM product__ p
JOIN order__ o
ON p.productid = o.productid
GROUP BY p.category;

--Find customers whose average order quantity is greater than 5

SELECT c.customerid,c.customername,AVG(o.quantity) AS average_quantity
FROM customer__ c
JOIN order__ o
ON c.customerid = o.customerid
GROUP BY c.customerid, c.customername
HAVING AVG(o.quantity) > 5;