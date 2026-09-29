--Find the number of orders placed for each quantity value

SELECT quantity,
COUNT(*) AS order_count
FROM order__
GROUP BY quantity
ORDER BY quantity;

--Find products where the selling price is exactly equal to twice the cost price

SELECT productid,productname,price,costprice
FROM product__
WHERE price = 2 * costprice;