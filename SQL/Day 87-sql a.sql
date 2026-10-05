--Find customers with exactly 2 orders

SELECT c.customerid,c.customername,COUNT(o.orderid) AS total_orders
FROM customer__ c JOIN order__ o
ON c.customerid = o.customerid
GROUP BY c.customerid, c.customername
HAVING COUNT(o.orderid) = 2;

--Find the total quantity and revenue for every product

SELECT p.productid,p.productname,SUM(o.quantity) AS total_quantity,SUM(o.quantity * p.price) AS total_revenue
FROM product__ p JOIN order__ o
ON p.productid = o.productid
GROUP BY p.productid, p.productname;