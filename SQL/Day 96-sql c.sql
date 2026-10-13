--Find customers who have never purchased an Electronics product

SELECT
    c.customerid,
    c.customername
FROM customer__ c
WHERE NOT EXISTS (
    SELECT 1
    FROM order__ o
    JOIN product__ p
        ON o.productid = p.productid
    WHERE o.customerid = c.customerid
      AND p.category = 'Electronics'
);

--Calculate the monthly change in revenue compared with the previous month

WITH MonthlySales AS (
    SELECT
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
        YEAR(o.orderdate),
        MONTH(o.orderdate)
),
RevenueComparison AS (
    SELECT
        sales_month,
        revenue,
        LAG(revenue) OVER (
            ORDER BY sales_month
        ) AS previous_month_revenue
    FROM MonthlySales
)
SELECT
    sales_month,
    revenue,
    previous_month_revenue,
    revenue - previous_month_revenue AS revenue_change
FROM RevenueComparison;
