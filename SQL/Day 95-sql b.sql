--Calculate the difference between each product's price and its category's average price

SELECT productid,productname,category,price,
AVG(price) OVER (PARTITION BY category) AS category_avg_price,price - AVG(price) OVER (PARTITION BY category) AS price_difference
FROM product__;

--Find customers who placed exactly 5 orders

SELECT c.customerid,c.customername,COUNT(o.orderid) AS total_orders
FROM customer__ c
JOIN order__ o
ON c.customerid = o.customerid
GROUP BY c.customerid, c.customername
HAVING COUNT(o.orderid) = 5;