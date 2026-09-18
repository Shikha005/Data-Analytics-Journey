--Find product categories whose total profit is greater than ₹20,000.

SELECT p.Category,SUM(o.Quantity * (o.UnitPrice - p.CostPrice)) AS TotalProfit
FROM order__ o
INNER JOIN product__ p
ON o.ProductID = p.ProductID
GROUP BY p.Category
HAVING SUM(o.Quantity * (o.UnitPrice - p.CostPrice)) > 20000
ORDER BY TotalProfit DESC;

--Find the number of unique cities from which active customers belong.

SELECT COUNT(DISTINCT City) AS UniqueCities
FROM customer__
WHERE Status = 'Active';

--Increase the salary of all employees in the Sales department by 10%.

UPDATE employee__
SET Salary = Salary * 1.10
WHERE Department = 'Sales';