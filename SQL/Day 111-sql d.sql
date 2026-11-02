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

--Find each customer's favorite product category by purchase quantity

WITH CategoryQuantity AS (
    SELECT
        c.customerid,
        c.customername,
        p.category,
        SUM(o.quantity) AS TotalQuantity
    FROM customer__ c
    JOIN order__ o
        ON c.customerid = o.customerid
    JOIN product__ p
        ON o.productid = p.productid
    GROUP BY
        c.customerid,
        c.customername,
        p.category
),
RankedCategories AS (
    SELECT *,
        DENSE_RANK() OVER (
            PARTITION BY customerid
            ORDER BY TotalQuantity DESC
        ) AS CategoryRank
    FROM CategoryQuantity
)
SELECT
    customerid,
    customername,
    category,
    TotalQuantity
FROM RankedCategories
WHERE CategoryRank = 1;