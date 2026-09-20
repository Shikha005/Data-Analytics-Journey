--Find the difference between the highest and lowest salary in each department.

SELECT Department,MAX(Salary) AS HighestSalary,MIN(Salary) AS LowestSalary,MAX(Salary) - MIN(Salary) AS SalaryDifference
FROM employee__
GROUP BY Department
ORDER BY SalaryDifference DESC;

--Find products whose price is higher than the average price of their category.

SELECT p.ProductID,p.ProductName,p.Category,p.Price
FROM product__ p
WHERE p.Price > (SELECT AVG(p2.Price)
FROM product__ p2
WHERE p2.Category = p.Category
)
ORDER BY p.Category, p.Price DESC;

