--Find the second-highest product price

SELECT MAX(price) AS second_highest_price
FROM product__
WHERE price < (SELECT MAX(price) FROM product__);

--Find employees who have handled orders for more than 2 different customers

SELECT e.employeeid,e.employeename,
COUNT(DISTINCT o.customerid) AS different_customers
FROM employee__ e JOIN order__ o
ON e.employeeid = o.employeeid
GROUP BY e.employeeid, e.employeename
HAVING COUNT(DISTINCT o.customerid) > 2;