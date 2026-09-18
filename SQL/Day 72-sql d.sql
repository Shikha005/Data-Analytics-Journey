--Assign a row number to each customer's orders, with their latest order getting number 1.

SELECT OrderID,CustomerID,OrderDate,Quantity,
ROW_NUMBER() OVER (PARTITION BY CustomerID ORDER BY OrderDate DESC) AS OrderNumber
FROM order__;

--For each customer, display their order date and the next order date placed by the same customer.

SELECT CustomerID,OrderID,OrderDate,
LEAD(OrderDate) OVER (PARTITION BY CustomerID ORDER BY OrderDate) AS NextOrderDate
FROM order__
ORDER BY CustomerID, OrderDate;
