--Find orders containing more than one distinct product

SELECT
    orderid,
    COUNT(DISTINCT productid) AS DistinctProducts
FROM order__
GROUP BY orderid
HAVING COUNT(DISTINCT productid) > 1;

--Classify products based on their profit margin

SELECT
    productid,
    productname,
    price,
    costprice,
    price - costprice AS ProfitPerUnit,
    CASE
        WHEN price <= 0 THEN 'Invalid Price'
        WHEN 100.0 * (price - costprice) / price >= 40
            THEN 'High Margin'
        WHEN 100.0 * (price - costprice) / price >= 15
            THEN 'Medium Margin'
        ELSE 'Low Margin'
    END AS ProfitMarginCategory
FROM product__;