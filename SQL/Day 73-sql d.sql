-- Find the number of days taken to deliver each completed order

SELECT OrderID,CustomerID,OrderDate,DeliveryDate,
DATEDIFF(DAY, OrderDate, DeliveryDate) AS DeliveryDays
FROM order__
WHERE DeliveryDate IS NOT NULL
ORDER BY DeliveryDays DESC;

--Find employees whose salary is higher than the average salary of their department.

SELECT e.EmployeeID,e.EmployeeName,e.Department,e.Salary
FROM employee__ e
WHERE e.Salary > (SELECT AVG(e2.Salary) FROM employee__ e2 WHERE e2.Department = e.Department)
ORDER BY e.Department, e.Salary DESC;