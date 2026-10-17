--find products that generated sales but have a negative profit margin

SELECT
    p.productid,
    p.productname,
    p.price,
    p.costprice,
    SUM(o.quantity) AS total_quantity_sold,
    SUM(o.quantity * (p.price - p.costprice)) AS total_profit
FROM product__ p
JOIN order__ o
    ON p.productid = o.productid
GROUP BY
    p.productid,
    p.productname,
    p.price,
    p.costprice
HAVING SUM(o.quantity * (p.price - p.costprice)) < 0;

--Display each order with its percentage contribution to that customer's total spending

WITH OrderValues AS (
    SELECT
        o.customerid,
        o.orderid,
        SUM(o.quantity * p.price) AS order_value
    FROM order__ o
    JOIN product__ p
        ON o.productid = p.productid
    GROUP BY o.customerid, o.orderid
)
SELECT
    customerid,
    orderid,
    order_value,
    ROUND(
        order_value * 100.0 /
        NULLIF(
            SUM(order_value) OVER (
                PARTITION BY customerid
            ), 0
        ),
        2
    ) AS spending_percentage
FROM OrderValues;