select * from Employees
select * from Projects
select * from Departments
select * from EmployeeProjects

--find the employee based on their firstname(alphabetically) from each department
select firstname,lastname,departmentid,
row_number() over (partition by departmentid order by firstname asc) 
from employees