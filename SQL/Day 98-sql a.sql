--Find the third-highest distinct product price
WITH PriceRanks AS (
    SELECT
        productid,
        productname,
        price,
        DENSE_RANK() OVER (
            ORDER BY price DESC
        ) AS price_rank
    FROM product__
)
SELECT productid, productname, price
FROM PriceRanks
WHERE price_rank = 3;

--Find customers who purchased more than one product on the same order date

SELECT
    c.customerid,
    c.customername,
    CAST(o.orderdate AS DATE) AS order_date,
    COUNT(DISTINCT o.productid) AS different_products
FROM customer__ c
JOIN order__ o
    ON c.customerid = o.customerid
GROUP BY
    c.customerid,
    c.customername,
    CAST(o.orderdate AS DATE)
HAVING COUNT(DISTINCT o.productid) > 1;