--Find the average discount given for each product category. Display the category and average discount percentage.

select * from customer__
select * from employee__
select * from product__
select * from order__

SELECT p.Category,AVG(o.DiscountPercent) AS AverageDiscount
FROM product__ p
JOIN order__ o
ON p.ProductID = o.ProductID
GROUP BY p.Category
ORDER BY AverageDiscount DESC;