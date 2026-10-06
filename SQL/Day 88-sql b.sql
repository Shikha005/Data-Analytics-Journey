--. Find the product with the highest profit margin

SELECT TOP 1 productid,productname,price,costprice,((price - costprice) * 100.0 / NULLIF(price, 0)) AS profit_margin
FROM product__
ORDER BY profit_margin DESC;

--Find employees who handled orders on at least 3 different dates

SELECT e.employeeid,e.employeename,COUNT(DISTINCT o.orderdate) AS working_days
FROM employee__ e
JOIN order__ o
ON e.employeeid = o.employeeid
GROUP BY e.employeeid, e.employeename
HAVING COUNT(DISTINCT o.orderdate) >= 3;