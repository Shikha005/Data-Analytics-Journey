--Find the number of orders handled by each employee in descending order

SELECT e.employeeid,e.employeename,COUNT(o.orderid) AS total_orders,
RANK() OVER (ORDER BY COUNT(o.orderid) DESC) AS employee_rank
FROM employee__ e
JOIN order__ o
ON e.employeeid = o.employeeid
GROUP BY e.employeeid, e.employeename;

--Find customers who purchased the most expensive product

SELECT DISTINCT c.customerid,c.customername
FROM customer__ c
JOIN order__ o
ON c.customerid = o.customerid
JOIN product__ p
ON o.productid = p.productid
WHERE p.price = (SELECT MAX(price) FROM product__);