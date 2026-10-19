--Find the median product price

SELECT DISTINCT
    PERCENTILE_CONT(0.5)
    WITHIN GROUP (ORDER BY price)
    OVER () AS median_price
FROM product__;

--Find products whose profit is higher than 20% of their selling price

SELECT
    productid,
    productname,
    price,
    costprice,
    price - costprice AS profit
FROM product__
WHERE price > 0
  AND (price - costprice) > price * 0.20;