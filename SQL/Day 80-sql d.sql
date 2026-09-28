--Assign a rank to products based on their selling price

SELECT productid,productname,price,
RANK() OVER (ORDER BY price DESC) AS price_rank
FROM product__;

--Find each employee's percentage contribution to total orders

SELECT e.employeeid,e.employeename,
COUNT(o.orderid) AS employee_orders,
ROUND(COUNT(o.orderid) * 100.0 /SUM(COUNT(o.orderid)) OVER (),2) AS order_percentage
FROM employee__ e JOIN order__ o
ON e.employeeid = o.employeeid
GROUP BY e.employeeid, e.employeename;