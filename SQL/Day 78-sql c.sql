--Find the difference between product price and cost price

SELECT productid,productname,category,price,costprice,price - costprice AS profit_per_unit
FROM product__
ORDER BY profit_per_unit DESC;

--Find employees who have not handled any orders

SELECT e.employeeid,e.employeename
FROM employee__ e LEFT JOIN order__ o
ON e.employeeid = o.employeeid
WHERE o.orderid IS NULL;