--Find customers who purchased the same product on multiple different dates

SELECT
    c.customerid,
    c.customername,
    p.productid,
    p.productname,
    COUNT(DISTINCT CAST(o.orderdate AS DATE)) AS purchase_days
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
HAVING COUNT(DISTINCT CAST(o.orderdate AS DATE)) > 1;

--Find each category's contribution to total company revenue

WITH CategorySales AS (
    SELECT
        p.category,
        SUM(o.quantity * p.price) AS revenue
    FROM product__ p
    JOIN order__ o
        ON p.productid = o.productid
    GROUP BY p.category
)
SELECT
    category,
    revenue,
    ROUND(
        revenue * 100.0 /
        NULLIF(SUM(revenue) OVER (), 0),
        2
    ) AS revenue_percentage
FROM CategorySales
ORDER BY revenue DESC;