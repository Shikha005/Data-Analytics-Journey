--Find the number of unique products ordered by each customer

SELECT c.customerid,c.customername,
COUNT(DISTINCT o.productid) AS unique_products
FROM customer__ c JOIN order__ o
ON c.customerid = o.customerid
GROUP BY c.customerid, c.customername
ORDER BY unique_products DESC;

--Find products where the selling price is at least 20% higher than the cost price

SELECT productid,productname,price,costprice,((price - costprice) * 100.0 / costprice) AS profit_percentage
FROM product__
WHERE price >= costprice * 1.20;