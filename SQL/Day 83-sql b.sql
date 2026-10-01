--Find the latest order of each customer

SELECT
    c.customerid,
    c.customername,
    MAX(o.orderdate) AS latest_order_date
FROM customer__ c
JOIN order__ o
    ON c.customerid = o.customerid
GROUP BY c.customerid, c.customername;

--Find categories where the average product price is greater than ₹1,000

SELECT
    category,
    AVG(price) AS average_price
FROM product__
GROUP BY category
HAVING AVG(price) > 1000;