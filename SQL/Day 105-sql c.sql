--Find customers whose top product accounts for more than 60% of their spending

WITH CustomerProductSpend AS (
    SELECT
        o.customerid,
        o.productid,
        SUM(o.quantity * p.price) AS ProductSpend
    FROM order__ o
    JOIN product__ p
        ON o.productid = p.productid
    GROUP BY
        o.customerid,
        o.productid
),
CustomerTotal AS (
    SELECT
        customerid,
        SUM(ProductSpend) AS TotalSpend,
        MAX(ProductSpend) AS HighestProductSpend
    FROM CustomerProductSpend
    GROUP BY customerid
)
SELECT
    customerid,
    TotalSpend,
    HighestProductSpend,
    100.0 * HighestProductSpend / NULLIF(TotalSpend, 0)
        AS TopProductSpendPercentage
FROM CustomerTotal
WHERE 100.0 * HighestProductSpend / NULLIF(TotalSpend, 0) > 60;