--Find employees who handled orders for more than 50% of all customers
WITH EmployeeCustomerCount AS (
    SELECT
        employeeid,
        COUNT(DISTINCT customerid) AS CustomersHandled
    FROM order__
    GROUP BY employeeid
),
TotalCustomers AS (
    SELECT COUNT(*) AS CustomerCount
    FROM customer__
)
SELECT
    e.employeeid,
    e.employeename,
    ecc.CustomersHandled
FROM EmployeeCustomerCount ecc
JOIN employee__ e
    ON e.employeeid = ecc.employeeid
CROSS JOIN TotalCustomers tc
WHERE ecc.CustomersHandled > tc.CustomerCount * 0.50;

--Find products that have never been sold at a price below their listed price

SELECT
    p.productid,
    p.productname,
    p.price
FROM product__ p
WHERE NOT EXISTS (
    SELECT 1
    FROM order__ o
    WHERE o.productid = p.productid
      AND p.price < p.price
);
