--Find the total number of products in each category

SELECT
    category,
    COUNT(*) AS total_products
FROM product__
GROUP BY category;

--Find the customer who placed the earliest order

SELECT TOP 1
    c.customerid,
    c.customername,
    o.orderid,
    o.orderdate
FROM customer__ c
JOIN order__ o
    ON c.customerid = o.customerid
ORDER BY o.orderdate ASC;