--Find the highest and lowest quantity ordered for each customer

SELECT c.customerid,c.customername,MAX(o.quantity) AS highest_quantity,MIN(o.quantity) AS lowest_quantity
FROM customer__ c
JOIN order__ o
ON c.customerid = o.customerid
GROUP BY c.customerid, c.customername;

--Find the top 3 customers based on number of orders

SELECT TOP 3 c.customerid,c.customername,COUNT(o.orderid) AS total_orders
FROM customer__ c
JOIN order__ o
ON c.customerid = o.customerid
GROUP BY c.customerid, c.customername
ORDER BY total_orders DESC;