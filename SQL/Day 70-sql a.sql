select * from customer__
select * from employee__
select * from product__
select * from order__
--Find the total revenue generated in each city. Display the city and total revenue, and sort the result from highest to lowest revenue.

SELECT c.City,SUM(o.Quantity * o.UnitPrice) AS TotalRevenue
FROM customer__ c JOIN order__ o
ON c.CustomerID = o.CustomerID
GROUP BY c.City
ORDER BY TotalRevenue DESC;

--Find the customers who have placed at least 3 orders. Display their customer ID, name, and total number of orders.
select c.CustomerID,c.CustomerName,count(o.OrderID) as total_number_of_orders
from customer__ c join order__ o
on c.CustomerID = o.CustomerID
group by c.CustomerID,c.CustomerName
having count(o.OrderID) >=3
order by total_number_of_orders desc