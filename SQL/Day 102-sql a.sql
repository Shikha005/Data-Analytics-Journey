--Find customers whose spending is above the 90th percentile

WITH CustomerSpending AS (
    SELECT
        c.customerid,
        c.customername,
        SUM(o.quantity * p.price) AS total_spending
    FROM customer__ c
    JOIN order__ o
        ON c.customerid = o.customerid
    JOIN product__ p
        ON o.productid = p.productid
    GROUP BY c.customerid, c.customername
),
SpendingPercentile AS (
    SELECT *,
        PERCENTILE_CONT(0.90)
        WITHIN GROUP (ORDER BY total_spending)
        OVER () AS percentile_90
    FROM CustomerSpending
)
SELECT *
FROM SpendingPercentile
WHERE total_spending > percentile_90;

--Find products that were sold in every month of a given year

SELECT
    p.productid,
    p.productname,
    COUNT(DISTINCT MONTH(o.orderdate)) AS months_sold
FROM product__ p
JOIN order__ o
    ON p.productid = o.productid
WHERE YEAR(o.orderdate) = 2025
GROUP BY p.productid, p.productname
HAVING COUNT(DISTINCT MONTH(o.orderdate)) = 12;