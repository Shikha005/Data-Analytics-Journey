--Find the product with the largest difference between price and cost price

SELECT TOP 1 productid,productname,price,costprice,price - costprice AS profit_per_unit
FROM product__
ORDER BY profit_per_unit DESC;

--Find the number of products in each price range

SELECT
    CASE
        WHEN price < 500 THEN 'Below 500'
        WHEN price BETWEEN 500 AND 999 THEN '500-999'
        WHEN price BETWEEN 1000 AND 1999 THEN '1000-1999'
        ELSE '2000 and above'
    END AS price_range,
    COUNT(*) AS product_count
FROM product__
GROUP BY
    CASE
        WHEN price < 500 THEN 'Below 500'
        WHEN price BETWEEN 500 AND 999 THEN '500-999'
        WHEN price BETWEEN 1000 AND 1999 THEN '1000-1999'
        ELSE '2000 and above'
    END;