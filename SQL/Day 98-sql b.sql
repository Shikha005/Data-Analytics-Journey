--Calculate the total revenue and profit for each product category

SELECT
    p.category,
    SUM(o.quantity * p.price) AS total_revenue,
    SUM(o.quantity * (p.price - p.costprice)) AS total_profit
FROM product__ p
JOIN order__ o
    ON p.productid = o.productid
GROUP BY p.category
ORDER BY total_profit DESC;

--Find customers whose latest order was within the last 30 days
SELECT
    c.customerid,
    c.customername,
    MAX(o.orderdate) AS latest_order_date
FROM customer__ c
JOIN order__ o
    ON c.customerid = o.customerid
GROUP BY c.customerid, c.customername
HAVING MAX(o.orderdate) >= DATEADD(DAY, -30, GETDATE());
