--Find the average order quantity for each product category

SELECT
    p.category,
    AVG(o.quantity) AS avg_quantity
FROM order__ o
JOIN product__ p
    ON o.productid = p.productid
GROUP BY p.category;

--Find products whose price is higher than the average product price

SELECT
    productid,
    productname,
    price
FROM product__
WHERE price > (
    SELECT AVG(price)
    FROM product__
);