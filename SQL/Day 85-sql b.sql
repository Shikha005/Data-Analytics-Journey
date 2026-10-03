--Find products that have been ordered by at least 3 different customers

SELECT p.productid,p.productname,COUNT(DISTINCT o.customerid) AS customer_count
FROM product__ p JOIN order__ o 
ON p.productid = o.productid
GROUP BY p.productid, p.productname
HAVING COUNT(DISTINCT o.customerid) >= 3;

--Find the total revenue and profit for each employee

SELECT e.employeeid,e.employeename,SUM(o.quantity * p.price) AS total_revenue,SUM(o.quantity * (p.price - p.costprice)) AS total_profit
FROM employee__ e
JOIN order__ o
ON e.employeeid = o.employeeid
JOIN product__ p
ON o.productid = p.productid
GROUP BY e.employeeid, e.employeename;