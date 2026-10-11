--Find customers who ordered products with below-average cost prices

SELECT DISTINCT
    c.customerid,
    c.customername
FROM customer__ c
JOIN order__ o
    ON c.customerid = o.customerid
JOIN product__ p
    ON o.productid = p.productid
WHERE p.costprice < (
    SELECT AVG(costprice)
    FROM product__
);

--Calculate the monthly revenue and assign a rank to each month

WITH MonthlyRevenue AS (
    SELECT
        YEAR(o.orderdate) AS sales_year,
        MONTH(o.orderdate) AS sales_month,
        SUM(o.quantity * p.price) AS total_revenue
    FROM order__ o
    JOIN product__ p
        ON o.productid = p.productid
    GROUP BY
        YEAR(o.orderdate),
        MONTH(o.orderdate)
)
SELECT
    sales_year,
    sales_month,
    total_revenue,
    DENSE_RANK() OVER (
        ORDER BY total_revenue DESC
    ) AS revenue_rank
FROM MonthlyRevenue;