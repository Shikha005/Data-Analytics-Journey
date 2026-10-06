--Calculate the cumulative quantity sold by product price

SELECT p.productid,p.productname,p.price,SUM(o.quantity) AS quantity_sold,
SUM(SUM(o.quantity)) OVER (
        ORDER BY p.price
    ) AS cumulative_quantity
FROM product__ p
JOIN order__ o
    ON p.productid = o.productid
GROUP BY p.productid, p.productname, p.price;

--Find the second-highest revenue-generating customer

WITH customer_revenue AS (
SELECT c.customerid,c.customername,SUM(o.quantity * p.price) AS total_revenue 
FROM customer__ c
JOIN order__ o
ON c.customerid = o.customerid
JOIN product__ p
ON o.productid = p.productid
GROUP BY c.customerid, c.customername
),
ranked_customers AS (
SELECT *,
DENSE_RANK() OVER (ORDER BY total_revenue DESC) AS revenue_rank
FROM customer_revenue
)
SELECT customerid,customername,total_revenue
FROM ranked_customers
WHERE revenue_rank = 2;