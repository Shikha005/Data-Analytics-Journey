--Show the change in sales revenue between consecutive order dates

WITH daily_sales AS (
    SELECT
        o.orderdate,
        SUM(o.quantity * p.price) AS daily_revenue
    FROM order__ o
    JOIN product__ p
        ON o.productid = p.productid
    GROUP BY o.orderdate
)
SELECT
    orderdate,
    daily_revenue,
    LAG(daily_revenue) OVER (
        ORDER BY orderdate
    ) AS previous_day_revenue,
    daily_revenue - LAG(daily_revenue) OVER (
        ORDER BY orderdate
    ) AS revenue_change
FROM daily_sales;

--Find employees whose sales are in the top 25% of employees

WITH employee_sales AS (
    SELECT
        e.employeeid,
        e.employeename,
        SUM(o.quantity * p.price) AS total_sales
    FROM employee__ e
    JOIN order__ o
        ON e.employeeid = o.employeeid
    JOIN product__ p
        ON o.productid = p.productid
    GROUP BY e.employeeid, e.employeename
),
ranked_sales AS (
    SELECT
        *,
        NTILE(4) OVER (
            ORDER BY total_sales DESC
        ) AS sales_quartile
    FROM employee_sales
)
SELECT
    employeeid,
    employeename,
    total_sales
FROM ranked_sales
WHERE sales_quartile = 1;