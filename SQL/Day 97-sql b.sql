--Find products whose sales quantity is greater than the average quantity sold per product

WITH ProductQuantity AS (
    SELECT
        p.productid,
        p.productname,
        SUM(o.quantity) AS total_quantity
    FROM product__ p
    JOIN order__ o
        ON p.productid = o.productid
    GROUP BY p.productid, p.productname
)
SELECT *
FROM ProductQuantity
WHERE total_quantity > (
    SELECT AVG(total_quantity)
    FROM ProductQuantity
);

--Find customers who placed orders in three consecutive months

WITH CustomerMonths AS (
    SELECT DISTINCT
        customerid,
        DATEFROMPARTS(
            YEAR(orderdate),
            MONTH(orderdate),
            1
        ) AS order_month
    FROM order__
),
MonthGroups AS (
    SELECT
        customerid,
        order_month,
        LAG(order_month, 1) OVER (
            PARTITION BY customerid
            ORDER BY order_month
        ) AS previous_month,
        LAG(order_month, 2) OVER (
            PARTITION BY customerid
            ORDER BY order_month
        ) AS two_months_before
    FROM CustomerMonths
)
SELECT DISTINCT customerid
FROM MonthGroups
WHERE previous_month = DATEADD(MONTH, -1, order_month)
  AND two_months_before = DATEADD(MONTH, -2, order_month);