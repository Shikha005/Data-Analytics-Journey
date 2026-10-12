--Find customers who have placed orders in more than one year

SELECT
    c.customerid,
    c.customername,
    COUNT(DISTINCT YEAR(o.orderdate)) AS active_years
FROM customer__ c
JOIN order__ o
    ON c.customerid = o.customerid
GROUP BY c.customerid, c.customername
HAVING COUNT(DISTINCT YEAR(o.orderdate)) > 1;

--Calculate the percentage of total quantity sold by each product

SELECT
    p.productid,
    p.productname,
    SUM(o.quantity) AS total_quantity,
    ROUND(
        SUM(o.quantity) * 100.0 /
        NULLIF(SUM(SUM(o.quantity)) OVER (), 0),
        2
    ) AS quantity_percentage
FROM product__ p
JOIN order__ o
    ON p.productid = o.productid
GROUP BY p.productid, p.productname;