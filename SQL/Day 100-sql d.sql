--Find employees who generated no revenue from orders

SELECT
    e.employeeid,
    e.employeename
FROM employee__ e
WHERE NOT EXISTS (
    SELECT 1
    FROM order__ o
    JOIN product__ p
        ON o.productid = p.productid
    WHERE o.employeeid = e.employeeid
      AND o.quantity * p.price > 0
);

--Find each customer's most frequently purchased product

WITH ProductPurchases AS (
    SELECT
        o.customerid,
        p.productid,
        p.productname,
        SUM(o.quantity) AS total_quantity
    FROM order__ o
    JOIN product__ p
        ON o.productid = p.productid
    GROUP BY
        o.customerid,
        p.productid,
        p.productname
),
RankedPurchases AS (
    SELECT *,
        DENSE_RANK() OVER (
            PARTITION BY customerid
            ORDER BY total_quantity DESC
        ) AS purchase_rank
    FROM ProductPurchases
)
SELECT
    customerid,
    productid,
    productname,
    total_quantity
FROM RankedPurchases
WHERE purchase_rank = 1;
