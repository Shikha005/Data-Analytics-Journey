--Find the top 3 customers by total profit

WITH CustomerProfit AS (
    SELECT
        c.customerid,
        c.customername,
        SUM(o.quantity * (p.price - p.costprice)) AS total_profit
    FROM customer__ c
    JOIN order__ o
        ON c.customerid = o.customerid
    JOIN product__ p
        ON o.productid = p.productid
    GROUP BY c.customerid, c.customername
),
RankedCustomers AS (
    SELECT *,
        DENSE_RANK() OVER (
            ORDER BY total_profit DESC
        ) AS profit_rank
    FROM CustomerProfit
)
SELECT *
FROM RankedCustomers
WHERE profit_rank <= 3;