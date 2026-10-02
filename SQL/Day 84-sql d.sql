--Display each employee's orders with a sequential number

SELECT
    e.employeename,
    o.orderid,
    o.orderdate,
    ROW_NUMBER() OVER (
        PARTITION BY e.employeeid
        ORDER BY o.orderdate
    ) AS order_number
FROM employee__ e
JOIN order__ o
    ON e.employeeid = o.employeeid;

--Find categories where the total potential profit is greater than ₹20,000

SELECT
    p.category,
    SUM(o.quantity * (p.price - p.costprice)) AS total_profit
FROM product__ p
JOIN order__ o
    ON p.productid = o.productid
GROUP BY p.category
HAVING SUM(o.quantity * (p.price - p.costprice)) > 20000
ORDER BY total_profit DESC;