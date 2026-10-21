--Calculate each employee's average profit per order

WITH OrderProfit AS (
    SELECT
        o.employeeid,
        o.orderid,
        SUM(o.quantity * (p.price - p.costprice)) AS profit
    FROM order__ o
    JOIN product__ p
        ON o.productid = p.productid
    GROUP BY o.employeeid, o.orderid
)
SELECT
    e.employeeid,
    e.employeename,
    AVG(op.profit) AS average_profit_per_order
FROM employee__ e
JOIN OrderProfit op
    ON e.employeeid = op.employeeid
GROUP BY e.employeeid, e.employeename;

--Find pairs of customers who purchased the same product

SELECT DISTINCT
    c1.customerid AS customer1_id,
    c1.customername AS customer1_name,
    c2.customerid AS customer2_id,
    c2.customername AS customer2_name,
    p.productname
FROM order__ o1
JOIN order__ o2
    ON o1.productid = o2.productid
   AND o1.customerid < o2.customerid
JOIN customer__ c1
    ON o1.customerid = c1.customerid
JOIN customer__ c2
    ON o2.customerid = c2.customerid
JOIN product__ p
    ON o1.productid = p.productid;