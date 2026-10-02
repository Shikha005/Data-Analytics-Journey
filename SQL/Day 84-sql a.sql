--Find the total revenue generated on each order date

SELECT
    o.orderdate,
    SUM(o.quantity * p.price) AS daily_revenue
FROM order__ o
JOIN product__ p
    ON o.productid = p.productid
GROUP BY o.orderdate
ORDER BY o.orderdate;

--Find products whose price is higher than their category's average price

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