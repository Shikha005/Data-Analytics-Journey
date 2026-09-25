--Find the employee who handled the highest number of orders

SELECT TOP 1
    e.employeeid,
    e.employeename,
    COUNT(o.orderid) AS total_orders
FROM employee__ e
JOIN order__ o
    ON e.employeeid = o.employeeid
GROUP BY e.employeeid, e.employeename
ORDER BY total_orders DESC;

--Find each customer's total spending

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
ORDER BY total_spending DESC;