--Find customers whose order value is greater than their previous two orders' average

WITH OrderValues AS (
    SELECT
        o.customerid,
        o.orderid,
        o.orderdate,
        SUM(o.quantity * p.price) AS order_value
    FROM order__ o
    JOIN product__ p
        ON o.productid = p.productid
    GROUP BY o.customerid, o.orderid, o.orderdate
),
PreviousValues AS (
    SELECT *,
        LAG(order_value, 1) OVER (
            PARTITION BY customerid
            ORDER BY orderdate, orderid
        ) AS previous_order,
        LAG(order_value, 2) OVER (
            PARTITION BY customerid
            ORDER BY orderdate, orderid
        ) AS second_previous_order
    FROM OrderValues
)
SELECT
    customerid,
    orderid,
    order_value,
    previous_order,
    second_previous_order
FROM PreviousValues
WHERE order_value >
      (previous_order + second_previous_order) / 2.0;