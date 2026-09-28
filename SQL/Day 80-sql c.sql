--Find the total sales and average order quantity for each product

SELECT p.productid,p.productname,SUM(o.quantity * p.price) AS total_sales,AVG(o.quantity) AS average_quantity
FROM product__ p JOIN order__ o
ON p.productid = o.productid
GROUP BY p.productid, p.productname;

--Find customers who have never placed an orderFind customers who have never placed an order

SELECT c.customerid,c.customername
FROM customer__ c
WHERE NOT EXISTS (SELECT 1 FROM order__ o WHERE o.customerid = c.customerid);