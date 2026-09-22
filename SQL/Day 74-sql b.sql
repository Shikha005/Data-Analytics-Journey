--Find the average selling price for each product category.

SELECT p.Category,AVG(o.UnitPrice) AS AverageSellingPrice
FROM product__ p
INNER JOIN order__ o 
ON p.ProductID = o.ProductID
GROUP BY p.Category
ORDER BY AverageSellingPrice DESC;

--Find the employee with the second-highest salary.

SELECT EmployeeID,EmployeeName, Department, Salary
FROM
(SELECT EmployeeID,EmployeeName, Department,Salary,
DENSE_RANK() OVER (ORDER BY Salary DESC) AS SalaryRank
FROM employee__) AS RankedEmployees
WHERE SalaryRank = 2;