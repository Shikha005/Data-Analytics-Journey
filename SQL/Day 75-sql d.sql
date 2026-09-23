--Find departments where the average salary is greater than ₹55,000.

SELECT Department,COUNT(EmployeeID) AS TotalEmployees,AVG(Salary) AS AverageSalary
FROM employee__
GROUP BY Department
HAVING AVG(Salary) > 55000
ORDER BY AverageSalary DESC;

--Find each customer's total orders and classify them as High, Medium, or Low based on order count.

WITH CustomerOrders AS
(
SELECT c.CustomerID,c.CustomerName,COUNT(o.OrderID) AS TotalOrders
FROM customer__ c LEFT JOIN order__ o
ON c.CustomerID = o.CustomerID
GROUP BY c.CustomerID, c.CustomerName
)
SELECT CustomerID,CustomerName,TotalOrders,
CASE
WHEN TotalOrders >= 4 THEN 'High'
WHEN TotalOrders BETWEEN 2 AND 3 THEN 'Medium'
WHEN TotalOrders = 1 THEN 'Low'
ELSE 'No Orders'
END AS CustomerCategory
FROM CustomerOrders
ORDER BY TotalOrders DESC;