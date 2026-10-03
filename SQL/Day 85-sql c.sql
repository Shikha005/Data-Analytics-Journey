--Find orders containing products from the highest-priced category

SELECT o.orderid,p.productname,p.category,p.price
FROM order__ o JOIN product__ p
ON o.productid = p.productid
WHERE p.category = (SELECT TOP 1 category FROM product__
GROUP BY category
ORDER BY AVG(price) DESC);

--Find the percentage difference between selling price and cost price

SELECT productid,productname,price,costprice,
ROUND(((price - costprice) / NULLIF(costprice, 0)) * 100,2) AS percentage_difference
FROM product__;