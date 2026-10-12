--Calculate the profit margin percentage of each product

SELECT productid,productname,price,costprice,
ROUND((price - costprice) * 100.0 /NULLIF(price, 0),2) AS profit_margin_percentage
FROM product__;

--Find orders whose revenue is greater than the average order-line revenue

SELECT
    o.orderid,
    o.customerid,
    p.productname,
    o.quantity * p.price AS revenue
FROM order__ o
JOIN product__ p
    ON o.productid = p.productid
WHERE o.quantity * p.price > (
    SELECT AVG(o2.quantity * p2.price)
    FROM order__ o2
    JOIN product__ p2
        ON o2.productid = p2.productid
);