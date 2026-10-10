--Find products whose selling price is in the top 3 distinct price levels

WITH price_levels AS (
    SELECT
        productid,
        productname,
        price,
        DENSE_RANK() OVER (
            ORDER BY price DESC
        ) AS price_level
    FROM product__
)
SELECT
    productid,
    productname,
    price
FROM price_levels
WHERE price_level <= 3

--Find the percentage of orders handled by each employee within each order date

SELECT
    orderdate,
    employeeid,
    COUNT(*) AS employee_orders,
    ROUND(
        COUNT(*) * 100.0 /
        SUM(COUNT(*)) OVER (PARTITION BY orderdate),
        2
    ) AS daily_order_percentage
FROM order__
GROUP BY orderdate, employeeid;