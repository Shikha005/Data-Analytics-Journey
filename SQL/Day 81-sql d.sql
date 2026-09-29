--Display products with a price category

SELECT productid,productname,price,
CASE
WHEN price < 500 THEN 'Low Price'
WHEN price BETWEEN 500 AND 1000 THEN 'Medium Price'
ELSE 'High Price'
END AS price_category
FROM product__;

--Find the average selling price and average cost price of each category

SELECT category,
ROUND(AVG(price), 2) AS average_selling_price,
ROUND(AVG(costprice), 2) AS average_cost_price
FROM product__
GROUP BY category
ORDER BY category;