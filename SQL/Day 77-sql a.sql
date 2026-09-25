--Find the top 3 products by total sales

SELECT TOP 3
    p.productname,
    SUM(o.quantity * p.price) AS total_sales
FROM order__ o
JOIN product__ p
    ON o.productid = p.productid
GROUP BY p.productname
ORDER BY total_sales DESC;

--Find customers who have placed more than 3 orders

SELECT
    c.customerid,
    c.customername,
    COUNT(o.orderid) AS total_orders
FROM customer__ c
JOIN order__ o
    ON c.customerid = o.customerid
GROUP BY c.customerid, c.customername
HAVING COUNT(o.orderid) > 3;