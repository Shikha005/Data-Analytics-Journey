--Find products whose selling price is higher than every product in the 'Electronics' category

SELECT
    productid,
    productname,
    price
FROM product__
WHERE price > ALL (
    SELECT price
    FROM product__
    WHERE category = 'Electronics'
);

--Find the number of different customers handled by each employee

SELECT
    e.employeeid,
    e.employeename,
    COUNT(DISTINCT o.customerid) AS customer_count
FROM employee__ e
JOIN order__ o
    ON e.employeeid = o.employeeid
GROUP BY e.employeeid, e.employeename;