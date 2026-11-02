--Find products with a higher-than-average selling quantity per transaction

WITH ProductTransactionQuantity AS (
    SELECT
        productid,
        orderid,
        SUM(quantity) AS TransactionQuantity
    FROM order__
    GROUP BY productid, orderid
),
ProductAverage AS (
    SELECT
        productid,
        AVG(CAST(TransactionQuantity AS DECIMAL(10, 2))) AS AverageQuantity
    FROM ProductTransactionQuantity
    GROUP BY productid
),
OverallAverage AS (
    SELECT AVG(AverageQuantity) AS AvgAcrossProducts
    FROM ProductAverage
)
SELECT
    pa.productid,
    p.productname,
    pa.AverageQuantity,
    oa.AvgAcrossProducts
FROM ProductAverage pa
JOIN product__ p
    ON p.productid = pa.productid
CROSS JOIN OverallAverage oa
WHERE pa.AverageQuantity > oa.AvgAcrossProducts;