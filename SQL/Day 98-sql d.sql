--Find employees whose revenue increased from their previous order

WITH OrderRevenue AS (
    SELECT
        o.employeeid,
        o.orderid,
        o.orderdate,
        SUM(o.quantity * p.price) AS revenue
    FROM order__ o
    JOIN product__ p
        ON o.productid = p.productid
    GROUP BY
        o.employeeid,
        o.orderid,
        o.orderdate
),
RevenueChanges AS (
    SELECT
        employeeid,
        orderid,
        orderdate,
        revenue,
        LAG(revenue) OVER (
            PARTITION BY employeeid
            ORDER BY orderdate, orderid
        ) AS previous_revenue
    FROM OrderRevenue
)
SELECT *
FROM RevenueChanges
WHERE revenue > previous_revenue;
