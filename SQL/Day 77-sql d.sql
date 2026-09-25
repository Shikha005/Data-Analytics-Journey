--Find products that have never been ordered

SELECT
    p.productid,
    p.productname,
    p.category
FROM product__ p
LEFT JOIN order__ o
    ON p.productid = o.productid
WHERE o.productid IS NULL;

--Find the category having the highest total profit

SELECT TOP 1
    p.category,
    SUM((o.quantity * p.price) - (o.quantity * p.costprice)) AS total_profit
FROM order__ o
JOIN product__ p
    ON o.productid = p.productid
GROUP BY p.category
ORDER BY total_profit DESC;
