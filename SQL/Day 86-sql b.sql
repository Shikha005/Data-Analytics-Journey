--Find the cheapest product in each category

SELECT p.category,p.productname,p.price
FROM product__ p
WHERE p.price = (SELECT MIN(p2.price) FROM product__ p2 WHERE p2.category = p.category);

--Find employees whose total sales are above the average employee sales

WITH employee_sales AS (
SELECT e.employeeid,e.employeename,SUM(o.quantity * p.price) AS total_sales
FROM employee__ e JOIN order__ o
ON e.employeeid = o.employeeid JOIN product__ p
ON o.productid = p.productid
GROUP BY e.employeeid, e.employeename
)
SELECT *
FROM employee_sales
WHERE total_sales > (
    SELECT AVG(total_sales)
    FROM employee_sales
);