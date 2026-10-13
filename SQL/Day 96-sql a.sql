--Find products with prices above the 75th percentile

SELECT productid,productname,price
FROM product__
WHERE price > (SELECT DISTINCT PERCENTILE_CONT(0.75) WITHIN GROUP (ORDER BY price) OVER () FROM product__);

--Find customers whose total spending is between ₹5,000 and ₹20,000

SELECT
    c.customerid,
    c.customername,
    SUM(o.quantity * p.price) AS total_spending
FROM customer__ c
JOIN order__ o
    ON c.customerid = o.customerid
JOIN product__ p
    ON o.productid = p.productid
GROUP BY c.customerid, c.customername
HAVING SUM(o.quantity * p.price)
       BETWEEN 5000 AND 20000;