--Find the total revenue for each product category

SELECT p.category,SUM(o.quantity * p.price) AS total_revenue
FROM order__ o JOIN product__ p
ON o.productid = p.productid
GROUP BY p.category
ORDER BY total_revenue DESC;

--Find customers who have placed orders on more than one different date

SELECT c.customerid,c.customername,COUNT(DISTINCT o.orderdate) AS different_order_dates
FROM customer__ c JOIN order__ o
ON c.customerid = o.customerid
GROUP BY c.customerid, c.customername
HAVING COUNT(DISTINCT o.orderdate) > 1;