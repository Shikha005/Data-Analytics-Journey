--Find products whose sales revenue is below the average revenue of products in the same category

WITH ProductRevenue AS (
    SELECT
        p.productid,
        p.productname,
        p.category,
        SUM(o.quantity * p.price) AS revenue
    FROM product__ p
    JOIN order__ o
        ON p.productid = o.productid
    GROUP BY
        p.productid,
        p.productname,
        p.category
)
SELECT *
FROM ProductRevenue pr
WHERE revenue < (
    SELECT AVG(pr2.revenue)
    FROM ProductRevenue pr2
    WHERE pr2.category = pr.category
);

--Calculate the order count and revenue for each weekday

SELECT
    DATENAME(WEEKDAY, o.orderdate) AS weekday_name,
    COUNT(DISTINCT o.orderid) AS total_orders,
    SUM(o.quantity * p.price) AS total_revenue
FROM order__ o
JOIN product__ p
    ON o.productid = p.productid
GROUP BY DATENAME(WEEKDAY, o.orderdate),
         DATEPART(WEEKDAY, o.orderdate)
ORDER BY DATEPART(WEEKDAY, o.orderdate);