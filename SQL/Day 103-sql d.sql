--Find the top-selling product by quantity in each year

WITH YearlyProductSales AS (
    SELECT
        YEAR(o.orderdate) AS sales_year,
        p.productid,
        p.productname,
        SUM(o.quantity) AS total_quantity
    FROM order__ o
    JOIN product__ p
        ON o.productid = p.productid
    GROUP BY
        YEAR(o.orderdate),
        p.productid,
        p.productname
),
RankedProducts AS (
    SELECT *,
        DENSE_RANK() OVER (
            PARTITION BY sales_year
            ORDER BY total_quantity DESC
        ) AS sales_rank
    FROM YearlyProductSales
)
SELECT
    sales_year,
    productid,
    productname,
    total_quantity
FROM RankedProducts
WHERE sales_rank = 1;