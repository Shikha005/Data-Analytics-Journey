--Find employees whose salary is greater than the average salary of all employees.

SELECT EmployeeID,EmployeeName,Department,Salary
FROM employee__
WHERE Salary > (SELECT AVG(Salary)FROM employee__)
ORDER BY Salary DESC;

--Display each customer's name in uppercase and extract the first 5 characters of their email.

SELECT CustomerID,UPPER(CustomerName) AS CustomerName,
LEFT(Email, 5) AS EmailPrefix
FROM customer__;

--Rank employees based on their salary within each department.

SELECT EmployeeID,EmployeeName,Department,Salary,
RANK() OVER (PARTITION BY Department ORDER BY Salary DESC) AS SalaryRank
FROM employee__;