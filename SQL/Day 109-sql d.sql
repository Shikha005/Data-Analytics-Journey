--Find the most frequently purchased product in each category

WITH ProductPopularity AS (
    SELECT
        p.productid,
        p.productname,
        p.category,
        COUNT(*) AS PurchaseCount
    FROM product__ p
    JOIN order__ o
        ON p.productid = o.productid
    GROUP BY
        p.productid,
        p.productname,
        p.category
),
RankedProducts AS (
    SELECT *,
        RANK() OVER (
            PARTITION BY category
            ORDER BY PurchaseCount DESC
        ) AS ProductRank
    FROM ProductPopularity
)
SELECT
    productid,
    productname,
    category,
    PurchaseCount
FROM RankedProducts
WHERE ProductRank = 1;