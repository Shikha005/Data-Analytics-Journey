select * from Employees
select * from Projects
select * from Departments
select * from EmployeeProjects

--find the employee who earns the highest salary
select * from employees
where salary =(select max(salary) from employees)

--find the list of employees which belongs of it and finance department
select * from employees
where departmentid in 
(select Departmentid from departments
where departmentname in ('it','finance'))
