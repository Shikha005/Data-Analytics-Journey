--Find customers who purchased at least 3 distinct products but never purchased the most expensive product

SELECT
    c.customerid,
    c.customername,
    COUNT(DISTINCT o.productid) AS different_products
FROM customer__ c
JOIN order__ o
    ON c.customerid = o.customerid
WHERE NOT EXISTS (
    SELECT 1
    FROM product__ p
    WHERE p.productid = o.productid
      AND p.price = (
          SELECT MAX(price)
          FROM product__
      )
)
GROUP BY c.customerid, c.customername
HAVING COUNT(DISTINCT o.productid) >= 3;

--Find the revenue ranking of each employee within their own order count group

WITH EmployeeStats AS (
    SELECT
        e.employeeid,
        e.employeename,
        COUNT(DISTINCT o.orderid) AS order_count,
        SUM(o.quantity * p.price) AS revenue
    FROM employee__ e
    JOIN order__ o
        ON e.employeeid = o.employeeid
    JOIN product__ p
        ON o.productid = p.productid
    GROUP BY e.employeeid, e.employeename
)
SELECT
    employeeid,
    employeename,
    order_count,
    revenue,
    DENSE_RANK() OVER (
        PARTITION BY order_count
        ORDER BY revenue DESC
    ) AS revenue_rank
FROM EmployeeStats;
