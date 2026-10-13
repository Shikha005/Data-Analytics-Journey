--Calculate each employee's share of total company revenue

WITH EmployeeSales AS (
    SELECT
        e.employeeid,
        e.employeename,
        SUM(o.quantity * p.price) AS total_revenue
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
    total_revenue,
    ROUND(
        total_revenue * 100.0 /
        NULLIF(SUM(total_revenue) OVER (), 0),
        2
    ) AS revenue_share_percentage
FROM EmployeeSales;

--Find products whose profit is above the average product profit

SELECT
    productid,
    productname,
    price - costprice AS profit
FROM product__
WHERE price - costprice > (
    SELECT AVG(price - costprice)
    FROM product__
);