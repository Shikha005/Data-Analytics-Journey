--Find orders where the total quantity is greater than the average order quantity

WITH OrderQuantity AS (
    SELECT
        orderid,
        SUM(quantity) AS TotalQuantity
    FROM order__
    GROUP BY orderid
)
SELECT
    orderid,
    TotalQuantity
FROM OrderQuantity
WHERE TotalQuantity > (
    SELECT AVG(TotalQuantity * 1.0)
    FROM OrderQuantity
);

--Show monthly revenue and the running revenue total across months

WITH MonthlyRevenue AS (
    SELECT
        YEAR(o.orderdate) AS OrderYear,
        MONTH(o.orderdate) AS OrderMonth,
        SUM(o.quantity * p.price) AS Revenue
    FROM order__ o
    JOIN product__ p
        ON o.productid = p.productid
    GROUP BY
        YEAR(o.orderdate),
        MONTH(o.orderdate)
)
SELECT
    OrderYear,
    OrderMonth,
    Revenue,
    SUM(Revenue) OVER (
        ORDER BY OrderYear, OrderMonth
        ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
    ) AS RunningRevenue
FROM MonthlyRevenue
ORDER BY OrderYear, OrderMonth;