--Find employees who generated more revenue than the average employee revenue

WITH EmployeeRevenue AS (
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
SELECT *
FROM EmployeeRevenue
WHERE total_revenue > (
    SELECT AVG(total_revenue)
    FROM EmployeeRevenue
);

--Find products that have never been ordered

SELECT
    p.productid,
    p.productname,
    p.category,
    p.price
FROM product__ p
WHERE NOT EXISTS (
    SELECT 1
    FROM order__ o
    WHERE o.productid = p.productid
);