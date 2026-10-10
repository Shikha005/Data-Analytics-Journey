--Find each category's share of total profit

WITH category_profit AS (
    SELECT
        p.category,
        SUM(o.quantity * (p.price - p.costprice)) AS total_profit
    FROM product__ p
    JOIN order__ o
        ON p.productid = o.productid
    GROUP BY p.category
)
SELECT
    category,
    total_profit,
    ROUND(
        total_profit * 100.0 /
        NULLIF(SUM(total_profit) OVER (), 0),
        2
    ) AS profit_share_percentage
FROM category_profit;

--Identify employees whose sales increased compared with the previous month

WITH monthly_sales AS (
    SELECT
        o.employeeid,
        DATEFROMPARTS(
            YEAR(o.orderdate),
            MONTH(o.orderdate),
            1
        ) AS sales_month,
        SUM(o.quantity * p.price) AS total_sales
    FROM order__ o
    JOIN product__ p
        ON o.productid = p.productid
    GROUP BY
        o.employeeid,
        YEAR(o.orderdate),
        MONTH(o.orderdate)
),
sales_comparison AS (
    SELECT
        employeeid,
        sales_month,
        total_sales,
        LAG(total_sales) OVER (
            PARTITION BY employeeid
            ORDER BY sales_month
        ) AS previous_month_sales
    FROM monthly_sales
)
SELECT
    employeeid,
    sales_month,
    total_sales,
    previous_month_sales
FROM sales_comparison
WHERE total_sales > previous_month_sales;