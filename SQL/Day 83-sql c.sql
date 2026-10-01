--Find employees who handled orders for customers whose names start with 'S'

SELECT DISTINCT
    e.employeeid,
    e.employeename
FROM employee__ e
JOIN order__ o
    ON e.employeeid = o.employeeid
JOIN customer__ c
    ON o.customerid = c.customerid
WHERE c.customername LIKE 'S%';

--Find the percentage of each product's contribution to total quantity sold

SELECT
    p.productname,
    SUM(o.quantity) AS total_quantity,
    ROUND(
        SUM(o.quantity) * 100.0 /
        SUM(SUM(o.quantity)) OVER (),
        2
    ) AS quantity_percentage
FROM product__ p
JOIN order__ o
    ON p.productid = o.productid
GROUP BY p.productid, p.productname;