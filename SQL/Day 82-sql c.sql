--Find the most frequently ordered quantity

SELECT TOP 1
    quantity,
    COUNT(*) AS times_ordered
FROM order__
GROUP BY quantity
ORDER BY times_ordered DESC;

--Show each product along with the number of times it was ordered
SELECT
    p.productid,
    p.productname,
    COUNT(o.orderid) AS order_count
FROM product__ p
LEFT JOIN order__ o
    ON p.productid = o.productid
GROUP BY p.productid, p.productname
ORDER BY order_count DESC;