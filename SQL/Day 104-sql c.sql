--Find the employee with the highest average revenue per customer

WITH EmployeeCustomerRevenue AS (
    SELECT
        e.employeeid,
        e.employeename,
        o.customerid,
        SUM(o.quantity * p.price) AS customer_revenue
    FROM employee__ e
    JOIN order__ o
        ON e.employeeid = o.employeeid
    JOIN product__ p
        ON o.productid = p.productid
    GROUP BY
        e.employeeid,
        e.employeename,
        o.customerid
),
EmployeeAverage AS (
    SELECT
        employeeid,
        employeename,
        AVG(customer_revenue) AS avg_revenue_per_customer
    FROM EmployeeCustomerRevenue
    GROUP BY employeeid, employeename
)
SELECT TOP 1 *
FROM EmployeeAverage
ORDER BY avg_revenue_per_customer DESC;