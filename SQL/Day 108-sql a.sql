--Find customers whose most recent order was within the last 30 days

WITH RankedOrders AS (
    SELECT
        customerid,
        orderid,
        orderdate,
        ROW_NUMBER() OVER (
            PARTITION BY customerid
            ORDER BY orderdate DESC, orderid DESC
        ) AS rn
    FROM order__
)
SELECT
    customerid,
    orderid,
    orderdate
FROM RankedOrders
WHERE rn = 1
  AND orderdate >= DATEADD(DAY, -30, GETDATE());

--Calculate each product's share of its category's total quantity sold

WITH ProductQuantity AS (
    SELECT
        p.productid,
        p.productname,
        p.category,
        SUM(o.quantity) AS TotalQuantity
    FROM product__ p
    JOIN order__ o
        ON p.productid = o.productid
    GROUP BY
        p.productid,
        p.productname,
        p.category
)
SELECT
    productid,
    productname,
    category,
    TotalQuantity,
    ROUND(
        100.0 * TotalQuantity /
        NULLIF(SUM(TotalQuantity) OVER (PARTITION BY category), 0),
        2
    ) AS CategoryQuantityPercentage
FROM ProductQuantity;