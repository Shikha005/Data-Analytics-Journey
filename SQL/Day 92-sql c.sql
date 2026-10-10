--Find products whose cost price is greater than the average selling price of all products

SELECT productid,productname,costprice
FROM product__
WHERE costprice > (SELECT AVG(price) FROM product__);

--Calculate the number of days between consecutive orders for each customer

WITH customer_orders AS (
    SELECT
        customerid,
        orderid,
        orderdate,
        LAG(orderdate) OVER (
            PARTITION BY customerid
            ORDER BY orderdate, orderid
        ) AS previous_order_date
    FROM order__
)
SELECT
    customerid,
    orderid,
    orderdate,
    previous_order_date,
    DATEDIFF(
        DAY,
        previous_order_date,
        orderdate
    ) AS days_between_orders
FROM customer_orders;