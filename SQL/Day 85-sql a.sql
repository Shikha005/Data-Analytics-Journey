--Find the total number of orders for each customer and classify them

SELECT c.customerid,c.customername,
COUNT(o.orderid) AS total_orders,
CASE
    WHEN COUNT(o.orderid) = 0 THEN 'No Orders'
    WHEN COUNT(o.orderid) <= 3 THEN 'Low'
    WHEN COUNT(o.orderid) <= 6 THEN 'Medium'
    ELSE 'High'
END AS customer_type
FROM customer__ c LEFT JOIN order__ o
ON c.customerid = o.customerid
GROUP BY c.customerid, c.customername;

--Find the most profitable order

SELECT TOP 1 o.orderid,o.productid,o.quantity,o.quantity * (p.price - p.costprice) AS order_profit
FROM order__ o JOIN product__ p
ON o.productid = p.productid
ORDER BY order_profit DESC;