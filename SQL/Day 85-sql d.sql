--Find the previous order date for every customer

SELECT customerid,orderid,orderdate,
LAG(orderdate) OVER (PARTITION BY customerid ORDER BY orderdate) AS previous_order_date
FROM order__;

--Find the number of unique products sold by each employee

SELECT e.employeeid,e.employeename,
COUNT(DISTINCT o.productid) AS unique_products_sold
FROM employee__ e JOIN order__ o
ON e.employeeid = o.employeeid
GROUP BY e.employeeid, e.employeename
ORDER BY unique_products_sold DESC;