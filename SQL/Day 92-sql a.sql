--Find customers who have placed orders in at least 2 different months

SELECT c.customerid,c.customername,COUNT(DISTINCT
FORMAT(o.orderdate, 'yyyy-MM')
) AS order_months
FROM customer__ c
JOIN order__ o
ON c.customerid = o.customerid
GROUP BY c.customerid, c.customername
HAVING COUNT(DISTINCT FORMAT(o.orderdate, 'yyyy-MM')) >= 2;

--Calculate the tax amount on each order assuming 18% tax

SELECT o.orderid,p.productname,o.quantity * p.price AS order_amount,
ROUND(o.quantity * p.price * 0.18, 2) AS tax_amount,
ROUND(o.quantity * p.price * 1.18, 2) AS amount_with_tax
FROM order__ o
JOIN product__ p
ON o.productid = p.productid;