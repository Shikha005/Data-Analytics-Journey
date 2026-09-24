--Calculate the delivery time for every delivered order.

SELECT OrderID,CustomerID,OrderDate,DeliveryDate,
DATEDIFF(DAY, OrderDate, DeliveryDate) AS DeliveryDays
FROM order__
WHERE DeliveryDate IS NOT NULL
ORDER BY DeliveryDays DESC;

--Find the highest-paid employee in each department.

WITH RankedEmployees AS
(
SELECT EmployeeID,EmployeeName,Department,Salary,
ROW_NUMBER() OVER (PARTITION BY Department ORDER BY Salary DESC) AS rn
FROM employee__
)
SELECT EmployeeID,EmployeeName,Department,Salary
FROM RankedEmployees
WHERE rn = 1;