--Using a CTE, find orders whose order value is greater than ₹50,000.

WITH OrderDetails AS
(
SELECT OrderID,CustomerID,ProductID,Quantity,UnitPrice,Quantity * UnitPrice AS OrderValue
FROM order__
)
SELECT OrderID,CustomerID,ProductID,OrderValue
FROM OrderDetails
WHERE OrderValue > 50000
ORDER BY OrderValue DESC;

--Find employees who do not have a manager assigned and display "No Manager" instead of NULL.

SELECT EmployeeID,EmployeeName,Department,COALESCE(
CAST(ManagerID AS VARCHAR(10)),'No Manager') AS Manager
FROM employee__;