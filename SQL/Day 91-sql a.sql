--Find customers whose latest order was placed in 2025

SELECT c.customerid,c.customername,MAX(o.orderdate) AS latest_order_date
FROM customer__ c
JOIN order__ o
ON c.customerid = o.customerid
GROUP BY c.customerid, c.customername
HAVING YEAR(MAX(o.orderdate)) = 2025;

--Calculate the discount needed to sell each product at 10% below its current price

SELECT productid, productname,price,price * 0.10 AS discount_amount,price * 0.90 AS discounted_price
FROM product__;