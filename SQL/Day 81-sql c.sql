--find the first order handled by each employee

SELECT e.employeeid,e.employeename,MIN(o.orderid) AS first_order_id
FROM employee__ e JOIN order__ o
ON e.employeeid = o.employeeid
GROUP BY e.employeeid, e.employeename;

--Find customers who purchased the same product more than once

SELECT customerid,productid,COUNT(*) AS purchase_count
FROM order__
GROUP BY customerid, productid
HAVING COUNT(*) > 1;