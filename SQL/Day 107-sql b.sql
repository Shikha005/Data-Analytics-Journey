--Find customers whose average order quantity is above the overall average

WITH CustomerAverage AS (
    SELECT
        customerid,
        AVG(CAST(quantity AS DECIMAL(10, 2))) AS AvgQuantity
    FROM order__
    GROUP BY customerid
)
SELECT
    customerid,
    AvgQuantity
FROM CustomerAverage
WHERE AvgQuantity > (
    SELECT AVG(CAST(quantity AS DECIMAL(10, 2)))
    FROM order__
);

--Display the cumulative quantity sold for each product over time

WITH DailyProductQuantity AS (
    SELECT
        productid,
        orderdate,
        SUM(quantity) AS DailyQuantity
    FROM order__
    GROUP BY
        productid,
        orderdate
)
SELECT
    productid,
    orderdate,
    DailyQuantity,
    SUM(DailyQuantity) OVER (
        PARTITION BY productid
        ORDER BY orderdate
        ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
    ) AS CumulativeQuantity
FROM DailyProductQuantity
ORDER BY productid, orderdate;