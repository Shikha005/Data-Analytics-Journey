--Find products that were ordered more than 5 times

SELECT p.productid,p.productname,
COUNT(o.orderid) AS order_count
FROM product__ p
JOIN order__ o
ON p.productid = o.productid
GROUP BY p.productid, p.productname
HAVING COUNT(o.orderid) > 5;

--Find each customer's most expensive purchase

SELECT c.customerid,c.customername,MAX(o.quantity * p.price) AS highest_purchase_value
FROM customer__ c
JOIN order__ o
ON c.customerid = o.customerid
JOIN product__ p
ON o.productid = p.productid
GROUP BY c.customerid, c.customername;