select * from Employees
select * from Projects
select * from Departments
select * from EmployeeProjects

--find the most recently assigned employee per project
with abc
as
(
select *,
dense_rank() over (partition by projectid order by AssignmentDate desc) dr
from employeeprojects
)
select p.projectname,CONCAT(e.firstname,'',e.lastname) fullname
from abc inner join employees e 
on(abc.employeeid =e.employeeid)
inner join projects p 
on(abc.projectid = p.projectid)
where dr=1

