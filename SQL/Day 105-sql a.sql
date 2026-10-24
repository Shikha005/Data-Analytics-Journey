--List each customer's products in a single string

SELECT
    c.customerid,
    c.customername,
    STRING_AGG(p.productname, ', ') AS ProductsPurchased
FROM customer__ c
JOIN order__ o
    ON c.customerid = o.customerid
JOIN product__ p
    ON o.productid = p.productid
GROUP BY
    c.customerid,
    c.customername;

--Show category totals and grand total

SELECT
    CASE
        WHEN GROUPING(p.category) = 1 THEN 'Grand Total'
        ELSE p.category
    END AS Category,
    SUM(o.quantity * p.price) AS TotalRevenue
FROM order__ o
JOIN product__ p
    ON o.productid = p.productid
GROUP BY ROLLUP(p.category);