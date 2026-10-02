--Find the number of orders placed on each date

SELECT
    orderdate,
    COUNT(orderid) AS total_orders
FROM order__
GROUP BY orderdate
ORDER BY orderdate;

--Find the employee with the highest average order quantity

SELECT TOP 1
    e.employeeid,
    e.employeename,
    AVG(o.quantity) AS average_quantity
FROM employee__ e
JOIN order__ o
    ON e.employeeid = o.employeeid
GROUP BY e.employeeid, e.employeename
ORDER BY average_quantity DESC;