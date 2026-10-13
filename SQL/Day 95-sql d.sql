--Find the first and last order date for each customer

SELECT
    c.customerid,
    c.customername,
    MIN(o.orderdate) AS first_order_date,
    MAX(o.orderdate) AS last_order_date,
    DATEDIFF(
        DAY,
        MIN(o.orderdate),
        MAX(o.orderdate)
    ) AS days_between_orders
FROM customer__ c
JOIN order__ o
    ON c.customerid = o.customerid
GROUP BY c.customerid, c.customername;

--Identify consecutive orders placed on the same date by the same customer

WITH CustomerOrders AS (
    SELECT
        customerid,
        orderid,
        orderdate,
        LAG(orderdate) OVER (
            PARTITION BY customerid
            ORDER BY orderdate, orderid
        ) AS previous_order_date
    FROM order__
)
SELECT
    customerid,
    orderid,
    orderdate,
    previous_order_date
FROM CustomerOrders
WHERE CAST(orderdate AS DATE) =
      CAST(previous_order_date AS DATE);