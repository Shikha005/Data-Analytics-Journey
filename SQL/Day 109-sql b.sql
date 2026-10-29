--Find products whose sales quantity is higher than the previous month

WITH MonthlyQuantity AS (
    SELECT
        p.productid,
        p.productname,
        YEAR(o.orderdate) AS OrderYear,
        MONTH(o.orderdate) AS OrderMonth,
        SUM(o.quantity) AS TotalQuantity
    FROM product__ p
    JOIN order__ o
        ON p.productid = o.productid
    GROUP BY
        p.productid,
        p.productname,
        YEAR(o.orderdate),
        MONTH(o.orderdate)
),
QuantityComparison AS (
    SELECT *,
        LAG(TotalQuantity) OVER (
            PARTITION BY productid
            ORDER BY OrderYear, OrderMonth
        ) AS PreviousMonthQuantity
    FROM MonthlyQuantity
)
SELECT
    productid,
    productname,
    OrderYear,
    OrderMonth,
    TotalQuantity,
    PreviousMonthQuantity
FROM QuantityComparison
WHERE TotalQuantity > PreviousMonthQuantity;