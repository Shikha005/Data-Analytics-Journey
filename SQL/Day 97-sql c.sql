--Find the highest-revenue order for each employee

WITH OrderRevenue AS (
    SELECT
        e.employeeid,
        e.employeename,
        o.orderid,
        SUM(o.quantity * p.price) AS revenue
    FROM employee__ e
    JOIN order__ o
        ON e.employeeid = o.employeeid
    JOIN product__ p
        ON o.productid = p.productid
    GROUP BY
        e.employeeid,
        e.employeename,
        o.orderid
),
RankedOrders AS (
    SELECT *,
        ROW_NUMBER() OVER (
            PARTITION BY employeeid
            ORDER BY revenue DESC
        ) AS rn
    FROM OrderRevenue
)
SELECT *
FROM RankedOrders
WHERE rn = 1;