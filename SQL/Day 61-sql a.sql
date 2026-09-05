CREATE TABLE employees (
    id INT PRIMARY KEY,
    name VARCHAR(50),
    department VARCHAR(50),
    salary INT,
    age INT,
    city VARCHAR(50),
    join_date DATE
);

INSERT INTO employees (id, name, department, salary, age, city, join_date) VALUES
(1, 'Amit',    'Sales',     45000, 28, 'Delhi',    '2019-05-10'),
(2, 'Priya',   'IT',        62000, 34, 'Mumbai',   '2021-03-15'),
(3, 'Ankit',   'HR',        38000, 24, 'Bangalore','2020-07-01'),
(4, 'Sneha',   'IT',        75000, 30, 'Delhi',    '2022-01-20'),
(5, 'Rahul',   'Sales',     51000, 26, 'Chennai',  '2018-11-05'),
(6, 'Anjali',  'Finance',   48000, 29, 'Mumbai',   '2020-09-12'),
(7, 'Vikram',  'IT',        90000, 40, 'Pune',     '2017-06-30'),
(8, 'Aarav',   'HR',        42000, 23, 'Delhi',    '2021-08-25'),
(9, 'Neha',    'Finance',   55000, 31, 'Chennai',  '2019-12-01'),
(10,'Karan',   'Sales',     47000, 27, 'Pune',     '2022-04-10');

select * from employees

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

