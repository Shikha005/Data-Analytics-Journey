--Find employees whose monthly revenue increased for three consecutive months

WITH MonthlyRevenue AS (
    SELECT
        employeeid,
        YEAR(orderdate) AS OrderYear,
        MONTH(orderdate) AS OrderMonth,
        SUM(o.quantity * p.price) AS Revenue
    FROM order__ o
    JOIN product__ p
        ON o.productid = p.productid
    GROUP BY
        employeeid,
        YEAR(orderdate),
        MONTH(orderdate)
),
RevenueTrends AS (
    SELECT *,
        LAG(Revenue, 1) OVER (
            PARTITION BY employeeid
            ORDER BY OrderYear, OrderMonth
        ) AS PreviousRevenue,
        LAG(Revenue, 2) OVER (
            PARTITION BY employeeid
            ORDER BY OrderYear, OrderMonth
        ) AS RevenueTwoMonthsAgo
    FROM MonthlyRevenue
)
SELECT
    employeeid,
    OrderYear,
    OrderMonth,
    Revenue
FROM RevenueTrends
WHERE Revenue > PreviousRevenue
  AND PreviousRevenue > RevenueTwoMonthsAgo;