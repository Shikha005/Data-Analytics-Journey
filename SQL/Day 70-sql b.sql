select * from customer__
select * from employee__
select * from product__
select * from order__

--Find the employee who generated the highest revenue. Display the employee ID, employee name, department, and total revenue.

SELECT top 1 e.EmployeeID,e.EmployeeName,e.Department,SUM(o.Quantity * o.UnitPrice) AS TotalRevenue
FROM employee__ e JOIN order__ o
ON e.EmployeeID = o.EmployeeID
GROUP BY e.EmployeeID,e.EmployeeName,e.Department
ORDER BY TotalRevenue DESC; 

--Find the products that have generated a profit of more than ₹10,000. Display the product name, category, and total profit.
select p.productname,p.category,sum(o.quantity*(p.price - p.costprice)) as total_profit
from order__ o left join product__ p 
on o.ProductID = p.ProductID
group by p.productname,p.category
having sum(o.quantity*(p.price - p.costprice)) >10000
order by total_profit desc

