--Calculate the number of days between consecutive orders for each customer

WITH CustomerOrders AS (
    SELECT
        customerid,
        orderid,
        orderdate,
        LAG(orderdate) OVER (
            PARTITION BY customerid
            ORDER BY orderdate, orderid
        ) AS PreviousOrderDate
    FROM order__
)
SELECT
    customerid,
    orderid,
    orderdate,
    PreviousOrderDate,
    DATEDIFF(DAY, PreviousOrderDate, orderdate) AS DaysBetweenOrders
FROM CustomerOrders
WHERE PreviousOrderDate IS NOT NULL;

--Show each employee's contribution to their department of sales staff

WITH EmployeeRevenue AS (
    SELECT
        e.employeeid,
        e.employeename,
        SUM(o.quantity * p.price) AS TotalRevenue
    FROM employee__ e
    JOIN order__ o
        ON e.employeeid = o.employeeid
    JOIN product__ p
        ON o.productid = p.productid
    GROUP BY
        e.employeeid,
        e.employeename
)
SELECT
    employeeid,
    employeename,
    TotalRevenue,
    100.0 * TotalRevenue
        / NULLIF(SUM(TotalRevenue) OVER (), 0) AS RevenueContributionPercent
FROM EmployeeRevenue;