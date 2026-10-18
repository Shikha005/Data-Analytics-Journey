--Find employees who handled orders for at least 5 distinct customers

SELECT
    e.employeeid,
    e.employeename,
    COUNT(DISTINCT o.customerid) AS unique_customers
FROM employee__ e
JOIN order__ o
    ON e.employeeid = o.employeeid
GROUP BY e.employeeid, e.employeename
HAVING COUNT(DISTINCT o.customerid) >= 5;

--Find the revenue difference between each product and the most profitable product in its category

WITH ProductProfit AS (
    SELECT
        p.productid,
        p.productname,
        p.category,
        SUM(o.quantity * (p.price - p.costprice)) AS total_profit
    FROM product__ p
    JOIN order__ o
        ON p.productid = o.productid
    GROUP BY p.productid, p.productname, p.category
)
SELECT
    productid,
    productname,
    category,
    total_profit,
    MAX(total_profit) OVER (
        PARTITION BY category
    ) AS category_max_profit,
    MAX(total_profit) OVER (
        PARTITION BY category
    ) - total_profit AS profit_difference
FROM ProductProfit;