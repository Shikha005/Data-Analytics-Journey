--Find products with a profit margin above their category's average profit margin

WITH ProductMargins AS (
    SELECT
        productid,
        productname,
        category,
        price,
        costprice,
        100.0 * (price - costprice) /
            NULLIF(price, 0) AS ProfitMargin
    FROM product__
),
CategoryMargins AS (
    SELECT
        *,
        AVG(ProfitMargin) OVER (
            PARTITION BY category
        ) AS AverageCategoryMargin
    FROM ProductMargins
)
SELECT
    productid,
    productname,
    category,
    ProfitMargin,
    AverageCategoryMargin
FROM CategoryMargins
WHERE ProfitMargin > AverageCategoryMargin;