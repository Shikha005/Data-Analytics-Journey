--Find gaps between consecutive order IDs

WITH OrderSequence AS (
    SELECT
        orderid,
        LEAD(orderid) OVER (ORDER BY orderid) AS NextOrderID
    FROM order__
)
SELECT
    orderid,
    NextOrderID,
    NextOrderID - orderid AS IDGap
FROM OrderSequence
WHERE NextOrderID - orderid > 1;

--Show each employee's average order quantity and high-quantity orders

SELECT
    e.employeeid,
    e.employeename,
    AVG(CAST(o.quantity AS DECIMAL(10, 2))) AS AverageQuantity,
    SUM(CASE
            WHEN o.quantity >= 10 THEN 1
            ELSE 0
        END) AS HighQuantityOrders,
    COUNT(*) AS TotalOrderRecords
FROM employee__ e
JOIN order__ o
    ON e.employeeid = o.employeeid
GROUP BY
    e.employeeid,
    e.employeename;