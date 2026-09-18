--Find customers for whom at least one order exists.

SELECT c.CustomerID,c.CustomerName,c.City
FROM customer__ c
WHERE EXISTS (SELECT 1 FROM order__ o WHERE o.CustomerID = c.CustomerID);

--Display a list of unique cities where either customers or employees are located.

SELECT City
FROM customer__

UNION

SELECT City
FROM employee__;