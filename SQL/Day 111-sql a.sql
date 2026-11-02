--Calculate the average number of days between orders for each customer

WITH DistinctOrders AS (
    SELECT
        customerid,
        orderid,
        MAX(orderdate) AS orderdate
    FROM order__
    GROUP BY customerid, orderid
),
OrderIntervals AS (
    SELECT
        customerid,
        orderid,
        orderdate,
        LAG(orderdate) OVER (
            PARTITION BY customerid
            ORDER BY orderdate, orderid
        ) AS PreviousOrderDate
    FROM DistinctOrders
)
SELECT
    customerid,
    AVG(
        CAST(DATEDIFF(DAY, PreviousOrderDate, orderdate) AS DECIMAL(10, 2))
    ) AS AverageDaysBetweenOrders
FROM OrderIntervals
WHERE PreviousOrderDate IS NOT NULL
GROUP BY customerid;