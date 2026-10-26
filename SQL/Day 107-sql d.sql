--Rank customers by the number of distinct products purchased

WITH CustomerProductCount AS (
    SELECT
        c.customerid,
        c.customername,
        COUNT(DISTINCT o.productid) AS DistinctProducts
    FROM customer__ c
    LEFT JOIN order__ o
        ON c.customerid = o.customerid
    GROUP BY
        c.customerid,
        c.customername
)
SELECT
    customerid,
    customername,
    DistinctProducts,
    DENSE_RANK() OVER (
        ORDER BY DistinctProducts DESC
    ) AS CustomerRank
FROM CustomerProductCount;

