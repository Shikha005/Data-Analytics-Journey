--Calculate each product's sales growth compared with the previous month

WITH MonthlyProductSales AS (
    SELECT
        p.productid,
        p.productname,
        DATEFROMPARTS(
            YEAR(o.orderdate),
            MONTH(o.orderdate),
            1
        ) AS sales_month,
        SUM(o.quantity * p.price) AS revenue
    FROM order__ o
    JOIN product__ p
        ON o.productid = p.productid
    GROUP BY
        p.productid,
        p.productname,
        YEAR(o.orderdate),
        MONTH(o.orderdate)
),
SalesComparison AS (
    SELECT *,
        LAG(revenue) OVER (
            PARTITION BY productid
            ORDER BY sales_month
        ) AS previous_month_revenue
    FROM MonthlyProductSales
)
SELECT
    productid,
    productname,
    sales_month,
    revenue,
    previous_month_revenue,
    ROUND(
        (revenue - previous_month_revenue) * 100.0 /
        NULLIF(previous_month_revenue, 0),
        2
    ) AS growth_percentage
FROM SalesComparison;