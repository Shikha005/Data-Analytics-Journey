--Classify customers as 'High' if their credit limit is above ₹70,000, 'Medium' if it is between ₹40,000 and ₹70,000, otherwise 'Low'.

SELECT CustomerID,CustomerName,CreditLimit,
    CASE
        WHEN CreditLimit > 70000 THEN 'High'
        WHEN CreditLimit BETWEEN 40000 AND 70000 THEN 'Medium'
        ELSE 'Low'
    END AS CreditCategory
FROM customer__;

--Find the total revenue generated in each month of 2025.

SELECT MONTH(OrderDate) AS OrderMonth,SUM(Quantity * UnitPrice) AS TotalRevenue
FROM order__
WHERE YEAR(OrderDate) = 2025
GROUP BY MONTH(OrderDate)
ORDER BY OrderMonth;