--Find customers whose spending is greater than their city's average spending

WITH CustomerSpending AS (
    SELECT
        c.customerid,
        c.customername,
        c.city,
        SUM(o.quantity * p.price) AS total_spending
    FROM customer__ c
    JOIN order__ o
        ON c.customerid = o.customerid
    JOIN product__ p
        ON o.productid = p.productid
    GROUP BY c.customerid, c.customername, c.city
)
SELECT *
FROM CustomerSpending cs
WHERE total_spending > (
    SELECT AVG(total_spending)
    FROM CustomerSpending
    WHERE city = cs.city
);

--Find the percentage of orders handled by each employee

SELECT
    e.employeeid,
    e.employeename,
    COUNT(o.orderid) AS total_orders,
    ROUND(
        COUNT(o.orderid) * 100.0 /
        NULLIF(SUM(COUNT(o.orderid)) OVER (), 0),
        2
    ) AS order_percentage
FROM employee__ e
LEFT JOIN order__ o
    ON e.employeeid = o.employeeid
GROUP BY e.employeeid, e.employeename;