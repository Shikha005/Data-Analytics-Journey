--Find the total cost of products sold in each category

SELECT p.category,SUM(o.quantity * p.costprice) AS total_cost
FROM order__ o
JOIN product__ p
ON o.productid = p.productid
GROUP BY p.category
ORDER BY total_cost DESC;

--Find customers whose total quantity purchased is exactly 20

SELECT c.customerid,c.customername,SUM(o.quantity) AS total_quantity
FROM customer__ c
JOIN order__ o
ON c.customerid = o.customerid
GROUP BY c.customerid, c.customername
HAVING SUM(o.quantity) = 20;