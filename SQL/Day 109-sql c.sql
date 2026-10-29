--Find customers whose spending is above the 75th percentile

WITH CustomerSpending AS (
    SELECT
        c.customerid,
        c.customername,
        SUM(o.quantity * p.price) AS TotalSpending
    FROM customer__ c
    JOIN order__ o
        ON c.customerid = o.customerid
    JOIN product__ p
        ON o.productid = p.productid
    GROUP BY
        c.customerid,
        c.customername
),
SpendingPercentile AS (
    SELECT *,
        PERCENTILE_CONT(0.75) WITHIN GROUP (
            ORDER BY TotalSpending
        ) OVER () AS Percentile75
    FROM CustomerSpending
)
SELECT
    customerid,
    customername,
    TotalSpending,
    Percentile75
FROM SpendingPercentile
WHERE TotalSpending > Percentile75;