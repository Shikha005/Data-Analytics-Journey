--Find the product having the highest price.
SELECT 
    ProductID,
    ProductName,
    Price
FROM Product__
WHERE Price = (
    SELECT MAX(Price)
    FROM Product__
);

--Display products whose price is greater than the average price of all products.
SELECT 
    ProductID,
    ProductName,
    Price
FROM Product__
WHERE Price > (
    SELECT AVG(Price)
    FROM Product__
)
ORDER BY Price DESC;

--Display the employee name and the orders handled by each employee.
SELECT 
    e.EmployeeID,
    e.EmployeeName,
    o.OrderID,
    o.OrderDate
FROM Employee__ e
JOIN Order__ o
    ON e.EmployeeID = o.EmployeeID
ORDER BY e.EmployeeName;