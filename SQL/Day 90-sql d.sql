--Find the difference between each order's value and the average order value

SELECT o.orderid,o.quantity * p.price AS order_value,
ROUND((o.quantity * p.price) - AVG(o.quantity * p.price) OVER (),2) AS difference_from_average
FROM order__ o
JOIN product__ p
ON o.productid = p.productid;

--Find the category with the greatest number of unique customers

WITH category_customers AS (
SELECT p.category,COUNT(DISTINCT o.customerid) AS customer_count
FROM product__ p
JOIN order__ o
ON p.productid = o.productid
GROUP BY p.category
)
SELECT category,customer_count
FROM category_customers
WHERE customer_count = (SELECT MAX(customer_count) FROM category_customers);