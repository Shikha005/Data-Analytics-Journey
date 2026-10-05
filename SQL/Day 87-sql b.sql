--Find products whose price is within 10% of the maximum product price

SELECT productid,productname,price
FROM product__
WHERE price >= (SELECT MAX(price) * 0.90 FROM product__);

--Find the number of orders handled by employees in each order date

SELECT e.employeename,o.orderdate,COUNT(o.orderid) AS total_orders
FROM employee__ e JOIN order__ o
ON e.employeeid = o.employeeid
GROUP BY e.employeename, o.orderdate
ORDER BY o.orderdate;