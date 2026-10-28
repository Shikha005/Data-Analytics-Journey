--Find employees whose revenue exceeds the average employee revenue

WITH EmployeeRevenue AS (
    SELECT
        e.employeeid,
        e.employeename,
        SUM(o.quantity * p.price) AS Revenue
    FROM employee__ e
    JOIN order__ o
        ON e.employeeid = o.employeeid
    JOIN product__
        ON o.productid = p.productid
    GROUP BY
        e.employeeid,
        e.employeename
)
SELECT
    employeeid,
    employeename,
    Revenue
FROM EmployeeRevenue
WHERE Revenue > (
    SELECT AVG(Revenue * 1.0)
    FROM EmployeeRevenue
);

--Identify customers who purchased every product in a specific category

SELECT
    c.customerid,
    c.customername
FROM customer__ c
WHERE NOT EXISTS (
    SELECT 1
    FROM product__ p
    WHERE p.category = 'Accessories'
      AND NOT EXISTS (
          SELECT 1
          FROM order__ o
          WHERE o.customerid = c.customerid
            AND o.productid = p.productid
      )
);