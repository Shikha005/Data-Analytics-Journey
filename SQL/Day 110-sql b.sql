--Find each customer's favorite product category by purchase quantity

WITH CategoryQuantity AS (
    SELECT
        c.customerid,
        c.customername,
        p.category,
        SUM(o.quantity) AS TotalQuantity
    FROM customer__ c
    JOIN order__ o
        ON c.customerid = o.customerid
    JOIN product__ p
        ON o.productid = p.productid
    GROUP BY
        c.customerid,
        c.customername,
        p.category
),
RankedCategories AS (
    SELECT *,
        DENSE_RANK() OVER (
            PARTITION BY customerid
            ORDER BY TotalQuantity DESC
        ) AS CategoryRank
    FROM CategoryQuantity
)
SELECT
    customerid,
    customername,
    category,
    TotalQuantity
FROM RankedCategories
WHERE CategoryRank = 1;