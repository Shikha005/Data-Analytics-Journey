--Find customers who ordered from at least 3 different product categories

SELECT c.customerid,c.customername,
COUNT(DISTINCT p.category) AS category_count
FROM customer__ c
JOIN order__ o
ON c.customerid = o.customerid
JOIN product__ p
ON o.productid = p.productid
GROUP BY c.customerid, c.customername
HAVING COUNT(DISTINCT p.category) >= 3

--Find the most expensive product in each category

WITH RankedProducts AS (
    SELECT
        productid,
        productname,
        category,
        price,
        RANK() OVER (
            PARTITION BY category
            ORDER BY price DESC
        ) AS price_rank
    FROM product__
)
SELECT *
FROM RankedProducts
WHERE price_rank = 1;