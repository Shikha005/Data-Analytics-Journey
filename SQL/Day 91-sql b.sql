--Find products whose selling price is above the median product price

SELECT productid,productname,price
FROM product__
WHERE price > (SELECT DISTINCT PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY price) OVER () FROM product__);

--Show each order's revenue alongside the customer's total revenue

WITH order_revenue AS (
    SELECT
        o.orderid,
        o.customerid,
        o.quantity * p.price AS revenue
    FROM order__ o
    JOIN product__ p
        ON o.productid = p.productid
)
SELECT
    orderid,
    customerid,
    revenue,
    SUM(revenue) OVER (
        PARTITION BY customerid
    ) AS customer_total_revenue
FROM order_revenue;