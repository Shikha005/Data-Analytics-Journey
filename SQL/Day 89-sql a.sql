--Find the total sales quantity for each employee

SELECT e.employeeid,e.employeename,
SUM(o.quantity) AS total_quantity_sold
FROM employee__ e
JOIN order__ o
ON e.employeeid = o.employeeid
GROUP BY e.employeeid, e.employeename;

--Find products where the profit per unit is less than ₹200

SELECT productid,productname,price,costprice,price - costprice AS profit_per_unit
FROM product__
WHERE price - costprice < 200;