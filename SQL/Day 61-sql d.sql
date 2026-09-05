select * from employees

--11. (Basic) Some employees have no city recorded (NULL). Write a query to find all employees where city IS NULL
select * from employees
where city is null

--12. (Basic-Medium) Write a query to get the list of distinct departments in the company (no duplicates).
select distinct department from employees

--13. (Medium) Write a query to find employees whose salary is exactly 45000 or 51000 or 62000
select * from employees
where salary in (45000,51000,62000)

--14. (Medium-Tough) Write a query to find employees who joined in the year 2019 or 2020,and whose department
--is not 'HR', and whose age is greater than 25 — but written using a nested condition with parentheses 
--to show operator precedence clearly (e.g., grouping the year condition properly)
select * from employees
where (join_date between '2019-01-01'and '2020-12-31') and department !='HR' and age > 25

--15. (Tough) Write a query to find employees whose:

--salary is above the "average-looking" threshold of 50000, or
--they are under age 25 and in the 'HR' department,

--then sort the result by city alphabetically, and for ties, by salary descending.
--(This tests your understanding of AND/OR precedence — think carefully about whether you need parentheses.)

select * from employees
where salary > 50000 or (age < 25 and department = 'HR')
order by city asc,salary desc