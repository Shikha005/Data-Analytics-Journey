--Find the highest-selling product for each category

WITH product_sales AS (
SELECT p.productid,p.productname,p.category,SUM(o.quantity) AS total_quantity
FROM product__ p JOIN order__ o
ON p.productid = o.productid
GROUP BY p.productid, p.productname, p.category
),
ranked_products AS (
SELECT *,
RANK() OVER (PARTITION BY category ORDER BY total_quantity DESC) AS rnk
FROM product_sales
)
SELECT productid,productname,category,total_quantity
FROM ranked_products
WHERE rnk = 1;

--Find the difference in days between a customer's first and last order

SELECT c.customerid,c.customername,
DATEDIFF(DAY,MIN(o.orderdate),MAX(o.orderdate)) AS days_between_orders
FROM customer__ c
JOIN order__ o
ON c.customerid = o.customerid
GROUP BY c.customerid, c.customername;