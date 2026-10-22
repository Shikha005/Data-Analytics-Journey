--Calculate each category's percentage of total quantity sold

WITH CategoryQuantity AS (
    SELECT
        p.category,
        SUM(o.quantity) AS total_quantity
    FROM product__ p
    JOIN order__ o
        ON p.productid = o.productid
    GROUP BY p.category
)
SELECT
    category,
    total_quantity,
    ROUND(
        total_quantity * 100.0 /
        NULLIF(SUM(total_quantity) OVER (), 0),
        2
    ) AS quantity_percentage
FROM CategoryQuantity
ORDER BY quantity_percentage DESC;

--Find customers who ordered from exactly three product categories

SELECT
    c.customerid,
    c.customername,
    COUNT(DISTINCT p.category) AS category_count
FROM customer__ c
JOIN order__ o
    ON c.customerid = o.customerid
JOIN product__ p
    ON o.productid = p.productid
GROUP BY c.customerid, c.customername
HAVING COUNT(DISTINCT p.category) = 3;