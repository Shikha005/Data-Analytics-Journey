--Find the total number of orders handled by each employee

SELECT e.employeeid,e.employeename,
COUNT(o.orderid) AS total_orders
FROM employee__ e LEFT JOIN order__ o
ON e.employeeid = o.employeeid
GROUP BY e.employeeid, e.employeename;

--Find categories containing more than 3 products

SELECT category,
COUNT(productid) AS product_count
FROM product__
GROUP BY category
HAVING COUNT(productid) > 3;