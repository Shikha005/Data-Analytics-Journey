--Find customers whose first order value was greater than ₹5,000

WITH FirstOrders AS (
    SELECT
        o.customerid,
        o.orderid,
        o.orderdate,
        o.quantity * p.price AS order_value,
        ROW_NUMBER() OVER (
            PARTITION BY o.customerid
            ORDER BY o.orderdate, o.orderid
        ) AS rn
    FROM order__ o
    JOIN product__ p
        ON o.productid = p.productid
)
SELECT
    c.customerid,
    c.customername,
    f.order_value
FROM FirstOrders f
JOIN customer__ c
    ON f.customerid = c.customerid
WHERE f.rn = 1
  AND f.order_value > 5000;

--Find products whose price is higher than the previous product's price when sorted by product ID

WITH ProductPrices AS (
    SELECT
        productid,
        productname,
        price,
        LAG(price) OVER (
            ORDER BY productid
        ) AS previous_price
    FROM product__
)
SELECT
    productid,
    productname,
    price,
    previous_price
FROM ProductPrices
WHERE price > previous_price;