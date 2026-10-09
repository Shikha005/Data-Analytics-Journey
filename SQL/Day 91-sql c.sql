--Find customers whose order quantities are consistently greater than 2

SELECT c.customerid,c.customername
FROM customer__ c
JOIN order__ o
ON c.customerid = o.customerid
GROUP BY c.customerid, c.customername
HAVING MIN(o.quantity) > 2;

--Find the percentage of products that belong to each category

SELECT category,
COUNT(*) AS total_products,
ROUND(COUNT(*) * 100.0 /SUM(COUNT(*)) OVER (),2) AS category_percentage
FROM product__
GROUP BY category;