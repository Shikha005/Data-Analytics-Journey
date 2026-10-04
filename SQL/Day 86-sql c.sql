--Find the percentage of profit for every product

SELECT productid,productname,price,costprice,
ROUND(((price - costprice) / NULLIF(price, 0)) * 100,2) AS profit_percentage
FROM product__;

--Find the first and last order date of each customer

SELECT c.customerid,c.customername,MIN(o.orderdate) AS first_order_date,MAX(o.orderdate) AS last_order_date
FROM customer__ c JOIN order__ o
ON c.customerid = o.customerid
GROUP BY c.customerid, c.customername;
