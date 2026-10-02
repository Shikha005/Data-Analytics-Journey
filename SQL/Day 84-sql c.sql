--Find customers who ordered products costing more than ₹2,000

SELECT DISTINCT
    c.customerid,
    c.customername
FROM customer__ c
JOIN order__ o
    ON c.customerid = o.customerid
JOIN product__ p
    ON o.productid = p.productid
WHERE p.price > 2000;

--Find the difference between the highest and lowest product price

SELECT
    MAX(price) - MIN(price) AS price_difference
FROM product__;
