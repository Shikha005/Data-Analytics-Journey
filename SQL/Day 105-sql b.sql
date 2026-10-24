--Find each customer's latest order using CROSS APPLY

SELECT
    c.customerid,
    c.customername,
    latest.orderid,
    latest.orderdate
FROM customer__ c
CROSS APPLY (
    SELECT TOP 1
        o.orderid,
        o.orderdate
    FROM order__ o
    WHERE o.customerid = c.customerid
    ORDER BY o.orderdate DESC, o.orderid DESC
) AS latest;

--Compare each product's price with its category's median price

WITH ProductMedian AS (
    SELECT
        productid,
        productname,
        category,
        price,
        PERCENTILE_CONT(0.5)
            WITHIN GROUP (ORDER BY price)
            OVER (PARTITION BY category) AS CategoryMedian
    FROM product__
)
SELECT
    productid,
    productname,
    category,
    price,
    CategoryMedian,
    price - CategoryMedian AS DifferenceFromMedian
FROM ProductMedian;