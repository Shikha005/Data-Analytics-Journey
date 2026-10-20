--Calculate the difference between each customer's spending and the highest customer's spending

WITH CustomerSpending AS (
    SELECT
        c.customerid,
        c.customername,
        SUM(o.quantity * p.price) AS total_spending
    FROM customer__ c
    JOIN order__ o
        ON c.customerid = o.customerid
    JOIN product__ p
        ON o.productid = p.productid
    GROUP BY c.customerid, c.customername
)
SELECT
    customerid,
    customername,
    total_spending,
    MAX(total_spending) OVER () AS highest_spending,
    MAX(total_spending) OVER () - total_spending
        AS spending_difference
FROM CustomerSpending
ORDER BY total_spending DESC;

--Find customers whose order quantity is higher than their previous order's quantity

WITH OrderQuantities AS (
    SELECT
        customerid,
        orderid,
        orderdate,
        SUM(quantity) AS total_quantity
    FROM order__
    GROUP BY customerid, orderid, orderdate
),
PreviousQuantities AS (
    SELECT
        *,
        LAG(total_quantity) OVER (
            PARTITION BY customerid
            ORDER BY orderdate, orderid
        ) AS previous_quantity
    FROM OrderQuantities
)
SELECT
    customerid,
    orderid,
    orderdate,
    total_quantity,
    previous_quantity
FROM PreviousQuantities
WHERE total_quantity > previous_quantity;