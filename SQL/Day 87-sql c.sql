--Find customers who bought both products from more than one category

SELECT c.customerid,c.customername
FROM customer__ c
JOIN order__ o
ON c.customerid = o.customerid
JOIN product__ p
ON o.productid = p.productid
GROUP BY c.customerid, c.customername
HAVING COUNT(DISTINCT p.category) >= 2

--Find the average profit per order for each category

SELECT p.category,AVG(o.quantity * (p.price - p.costprice)) AS average_profit
FROM product__ p
JOIN order__ o
ON p.productid = o.productid
GROUP BY p.category
ORDER BY average_profit DESC;