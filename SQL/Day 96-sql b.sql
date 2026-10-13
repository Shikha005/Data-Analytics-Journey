--Find the top 2 revenue-generating products in each category

WITH ProductSales AS (
    SELECT
        p.productid,
        p.productname,
        p.category,
        SUM(o.quantity * p.price) AS revenue
    FROM product__ p
    JOIN order__ o
        ON p.productid = o.productid
    GROUP BY p.productid, p.productname, p.category
),
RankedProducts AS (
    SELECT *,
        ROW_NUMBER() OVER (
            PARTITION BY category
            ORDER BY revenue DESC
        ) AS rn
    FROM ProductSales
)
SELECT *
FROM RankedProducts
WHERE rn <= 2;