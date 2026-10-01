--Find the second most expensive product in each category

WITH ranked_products AS (
    SELECT
        productid,
        productname,
        category,
        price,
        DENSE_RANK() OVER (
            PARTITION BY category
            ORDER BY price DESC
        ) AS price_rank
    FROM product__
)
SELECT
    productid,
    productname,
    category,
    price
FROM ranked_products
WHERE price_rank = 2;

--Find orders where the product's price is greater than the average price of its category

SELECT
    o.orderid,
    p.productname,
    p.category,
    p.price
FROM order__ o
JOIN product__ p
    ON o.productid = p.productid
WHERE p.price > (
    SELECT AVG(p2.price)
    FROM product__ p2
    WHERE p2.category = p.category
);