--Calculate the running total of profit for each product

WITH DailyProductProfit AS (
    SELECT
        o.orderdate,
        p.productid,
        p.productname,
        SUM(o.quantity * (p.price - p.costprice)) AS profit
    FROM order__ o
    JOIN product__ p
        ON o.productid = p.productid
    GROUP BY o.orderdate, p.productid, p.productname
)
SELECT
    orderdate,
    productid,
    productname,
    profit,
    SUM(profit) OVER (
        PARTITION BY productid
        ORDER BY orderdate
        ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
    ) AS running_profit
FROM DailyProductProfit;

--Calculate the running total of profit for each product

WITH DailyProductProfit AS (
    SELECT
        o.orderdate,
        p.productid,
        p.productname,
        SUM(o.quantity * (p.price - p.costprice)) AS profit
    FROM order__ o
    JOIN product__ p
        ON o.productid = p.productid
    GROUP BY o.orderdate, p.productid, p.productname
)
SELECT
    orderdate,
    productid,
    productname,
    profit,
    SUM(profit) OVER (
        PARTITION BY productid
        ORDER BY orderdate
        ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
    ) AS running_profit
FROM DailyProductProfit;

--Find product pairs belonging to the same category with a price difference below ₹500

SELECT
    p1.productname AS product1,
    p2.productname AS product2,
    p1.category,
    p1.price AS price1,
    p2.price AS price2,
    ABS(p1.price - p2.price) AS price_difference
FROM product__ p1
JOIN product__ p2
    ON p1.category = p2.category
   AND p1.productid < p2.productid
WHERE ABS(p1.price - p2.price) < 500;