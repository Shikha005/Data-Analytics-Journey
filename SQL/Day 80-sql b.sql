--Find orders where quantity is between 5 and 15

SELECT orderid,customerid,productid,quantity
FROM order__
WHERE quantity BETWEEN 5 AND 15
ORDER BY quantity DESC;

--Display products with their profit margin percentage

SELECT productid,productname,price,costprice,
ROUND(((price - costprice) * 100.0) / NULLIF(price, 0),2) AS profit_margin_percentage
FROM product__;