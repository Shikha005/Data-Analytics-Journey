--Find customers whose total spending is between ₹10,000 and ₹50,000

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
HAVING SUM(o.quantity * p.price) BETWEEN 10000 AND 50000;

--Find the running total of sales based on order date

SELECT
    o.orderid,
    o.orderdate,
    o.quantity * p.price AS sales,
    SUM(o.quantity * p.price) OVER (
        ORDER BY o.orderdate, o.orderid
    ) AS running_sales
FROM order__ o
JOIN product__ p
    ON o.productid = p.productid;