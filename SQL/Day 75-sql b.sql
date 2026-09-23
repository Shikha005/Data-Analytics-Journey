--Find employees whose salary is higher than the average salary of all employees.

SELECT EmployeeID, EmployeeName,Department,Salary
FROM employee__
WHERE Salary > (SELECT AVG(Salary) FROM employee__)
ORDER BY Salary DESC;

--Find the most expensive product in each category.

WITH RankedProducts AS
(
SELECT ProductID,ProductName,Category,Price,
RANK() OVER (PARTITION BY Category ORDER BY Price DESC) AS PriceRank
FROM product__
)
SELECT ProductID,ProductName,Category,Price
FROM RankedProducts
WHERE PriceRank = 1;