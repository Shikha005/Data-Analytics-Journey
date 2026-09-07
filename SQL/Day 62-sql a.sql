--Design a table BankAccounts for a banking system with:
--AccountNo (unique, never null)
--CustomerName (max 50 chars)
--Balance (must support values like 15000.75, up to 2 decimal places)
--AccountType (only short codes like 'SAV', 'CUR')
--OpenedDate (defaults to current date if not provided)
--Write the complete CREATE TABLE statement choosing appropriate data types for each.

create table bankaccount
(
accountno int not null unique,
customername varchar(50),
balance decimal(8,2),
accounttype char(3),
openeddate date default getdate()
)

select * from bankaccount

--A junior dev created this table — find and fix at least 3 data type/design mistakes:

   CREATE TABLE Orders_(
       OrderID VARCHAR(10),
       OrderAmount DECIMAL(10,2),
       OrderDate DATE,
       CustomerPhone VARCHAR(10)
   );

--Storage optimization problem: You need to store a "status" column that will only ever 
--contain 'A' (Active), 'I' (Inactive), 'P' (Pending). Write the CREATE TABLE column
--definition choosing the most storage-efficient data type, and justify your choice over using VARCHAR(20).

alter table bankaccount
add status char(1)

--Migration scenario: A table Customers has a column Phone VARCHAR(10). The business now wants to store 
--international numbers up to 15 characters including a '+' prefix. Write the ALTER statement to fix 
--this — and write a SELECT query to first check if any existing data would violate the new constraint length before altering.

alter table Orders_
alter column CustomerPhone varchar(15)

select * from Orders_
where LEN(CustomerPhone)>15