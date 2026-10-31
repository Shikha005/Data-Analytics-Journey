--Find products that have sales in every quarter of a year

WITH ProductQuarterSales AS (
    SELECT
        p.productid,
        p.productname,
        YEAR(o.orderdate) AS OrderYear,
        DATEPART(QUARTER, o.orderdate) AS OrderQuarter
    FROM product__ p
    JOIN order__ o
        ON p.productid = o.productid
    GROUP BY
        p.productid,
        p.productname,
        YEAR(o.orderdate),
        DATEPART(QUARTER, o.orderdate)
)
SELECT
    productid,
    productname,
    OrderYear,
    COUNT(DISTINCT OrderQuarter) AS QuartersWithSales
FROM ProductQuarterSales
GROUP BY
    productid,
    productname,
    OrderYear
HAVING COUNT(DISTINCT OrderQuarter) = 4;
