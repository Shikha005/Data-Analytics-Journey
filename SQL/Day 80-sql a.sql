--Find the highest quantity ordered for each product

SELECT p.productid,p.productname,MAX(o.quantity) AS highest_quantity
FROM product__ p JOIN order__ o
ON p.productid = o.productid
GROUP BY p.productid, p.productname;

--Find customers whose name starts with 'A'

SELECT customerid,customername
FROM customer__
WHERE customername LIKE 'A%';
