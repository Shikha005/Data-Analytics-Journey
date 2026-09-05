select * from employees

--9. (Medium-Tough) Write a query to find employees whose city ends with the letter 'i' and who joined before the year 2021.
select * from employees
where city like '%i' and join_date < '2021'

--10. (Tough) Write a query to find employees who satisfy all of the following:

--Their department is either 'Sales' or 'IT'
--Their salary is not less than 45000
--Their name does not start with 'K'
--Their join_date falls between '2018-01-01' and '2021-12-31'

select * from employees
where department in ('Sales','IT') and salary >= 45000 and name not like 'K%' and join_date between '2018-01-01' and '2021-12-31'