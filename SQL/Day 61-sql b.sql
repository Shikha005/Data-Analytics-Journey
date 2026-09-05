--6. (Basic-Medium) Write a query to find all employees whose name contains the letter 'a' (anywhere in the name, case-insensitive)

select * from employees
where name like '%A%'

--7. (Medium) Write a query to find employees who work in 'IT' or 'Finance' department and have a salary greater than 50000.
select * from employees
where department in ('IT','Finance') and salary > 50000

--8. (Medium) Write a query to find employees whose age is not between 25 and 30, ordered by salary in descending order.
select * from employees
where age not between 25 and 30
order by salary DESC