--Find customers who purchased the same product more than once

SELECT
    c.customerid,
    c.customername,
    p.productname,
    COUNT(*) AS PurchaseCount
FROM customer__ c
JOIN order__ o
    ON c.customerid = o.customerid
JOIN product__ p
    ON o.productid = p.productid
GROUP BY
    c.customerid,
    c.customername,
    p.productid,
    p.productname
HAVING COUNT(*) > 1;

--Calculate the percentage of each category's revenue contributed by each product

WITH ProductRevenue AS (
    SELECT
        p.productid,
        p.productname,
        p.category,
        SUM(o.quantity * p.price) AS Revenue
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
    Revenue,
    100.0 * Revenue /
        NULLIF(SUM(Revenue) OVER (PARTITION BY category), 0)
        AS CategoryRevenuePercentage
FROM ProductRevenue;