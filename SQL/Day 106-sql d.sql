--Find products whose selling price is higher than every product in another category

SELECT
    productid,
    productname,
    category,
    price
FROM product__
WHERE price > ALL (
    SELECT price
    FROM product__
    WHERE category = 'Accessories'
)
AND category <> 'Accessories';

--Calculate each product's share of total quantity sold

SELECT
    p.productid,
    p.productname,
    SUM(o.quantity) AS TotalQuantity,
    100.0 * SUM(o.quantity)
        / NULLIF(SUM(SUM(o.quantity)) OVER (), 0) AS QuantityPercentage
FROM product__ p
JOIN order__ o
    ON p.productid = o.productid
GROUP BY
    p.productid,
    p.productname;