select * from customer__
select * from employee__
select * from product__
select * from order__

--Find the monthly revenue for 2025. Display the month number and total revenue, sorted chronologically.

SELECT MONTH(OrderDate) AS OrderMonth,SUM(Quantity * UnitPrice) AS TotalRevenue
FROM order__
WHERE YEAR(OrderDate) = 2025
GROUP BY MONTH(OrderDate)
ORDER BY OrderMonth;
