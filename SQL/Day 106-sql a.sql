--Find customers who purchased products from at least three categories

SELECT
    c.customerid,
    c.customername,
    COUNT(DISTINCT p.category) AS CategoriesPurchased
FROM customer__ c
JOIN order__ o
    ON c.customerid = o.customerid
JOIN product__ p
    ON o.productid = p.productid
GROUP BY
    c.customerid,
    c.customername
HAVING COUNT(DISTINCT p.category) >= 3;

--Identify products whose price is above their category's average

SELECT
    p.productid,
    p.productname,
    p.category,
    p.price
FROM product__ p
WHERE p.price > (
    SELECT AVG(p2.price)
    FROM product__ p2
    WHERE p2.category = p.category
);