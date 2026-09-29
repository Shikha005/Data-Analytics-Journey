--Find the minimum quantity ordered for each product

SELECT p.productid,p.productname,MIN(o.quantity) AS minimum_quantity
FROM product__ p JOIN order__ o
ON p.productid = o.productid
GROUP BY p.productid, p.productname;

--Find customers whose name ends with 'a'

SELECT customerid,customername
FROM customer__
WHERE customername LIKE '%a';