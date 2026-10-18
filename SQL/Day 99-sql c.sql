--calculate each customer's order frequency in days

WITH CustomerDates AS (
    SELECT
        customerid,
        COUNT(*) AS total_orders,
        DATEDIFF(
            DAY,
            MIN(orderdate),
            MAX(orderdate)
        ) AS active_days
    FROM order__
    GROUP BY customerid
)
SELECT
    customerid,
    total_orders,
    active_days,
    CAST(
        active_days * 1.0 /
        NULLIF(total_orders - 1, 0)
        AS DECIMAL(10, 2)
    ) AS average_days_between_orders
FROM CustomerDates
WHERE total_orders > 1;