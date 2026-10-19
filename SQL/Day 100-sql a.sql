--Find customers whose spending increased with every order

WITH OrderValues AS (
    SELECT
        customerid,
        orderid,
        orderdate,
        SUM(quantity * p.price) AS order_value
    FROM order__ o
    JOIN product__ p
        ON o.productid = p.productid
    GROUP BY customerid, orderid, orderdate
),
OrderComparison AS (
    SELECT *,
        LAG(order_value) OVER (
            PARTITION BY customerid
            ORDER BY orderdate, orderid
        ) AS previous_value
    FROM OrderValues
)
SELECT customerid
FROM OrderComparison
GROUP BY customerid
HAVING COUNT(*) > 1
   AND SUM(
       CASE
           WHEN previous_value IS NOT NULL
            AND order_value <= previous_value
           THEN 1 ELSE 0
       END
   ) = 0;