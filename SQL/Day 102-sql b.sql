--Find customers who spent more on their latest order than on their first order

WITH OrderValues AS (
    SELECT
        o.customerid,
        o.orderid,
        o.orderdate,
        SUM(o.quantity * p.price) AS order_value,
        ROW_NUMBER() OVER (
            PARTITION BY o.customerid
            ORDER BY o.orderdate, o.orderid
        ) AS first_order,
        ROW_NUMBER() OVER (
            PARTITION BY o.customerid
            ORDER BY o.orderdate DESC, o.orderid DESC
        ) AS last_order
    FROM order__ o
    JOIN product__ p
        ON o.productid = p.productid
    GROUP BY o.customerid, o.orderid, o.orderdate
)
SELECT
    f.customerid,
    f.order_value AS first_order_value,
    l.order_value AS latest_order_value
FROM OrderValues f
JOIN OrderValues l
    ON f.customerid = l.customerid
WHERE f.first_order = 1
  AND l.last_order = 1

  AND l.order_value > f.order_value;