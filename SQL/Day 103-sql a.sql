--Find the longest gap between consecutive orders for each customer

WITH CustomerOrderDates AS (
    SELECT DISTINCT
        customerid,
        orderid,
        CAST(orderdate AS DATE) AS order_date
    FROM order__
),
OrderGaps AS (
    SELECT
        customerid,
        orderid,
        order_date,
        LAG(order_date) OVER (
            PARTITION BY customerid
            ORDER BY order_date, orderid
        ) AS previous_order_date
    FROM CustomerOrderDates
)
SELECT
    customerid,
    MAX(
        DATEDIFF(DAY, previous_order_date, order_date)
    ) AS longest_gap_days
FROM OrderGaps
WHERE previous_order_date IS NOT NULL
GROUP BY customerid;