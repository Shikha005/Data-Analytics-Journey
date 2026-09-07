--Write a script that creates a table Inventory, inserts a check to prevent it from being created twice 
--(i.e., write it so re-running the script doesn't throw an error if the table already exists). 
--(Hint: research IF NOT EXISTS / OBJECT_ID check — this is very commonly asked.)


--Write a single ALTER TABLE statement to add TWO new columns at once: Currency VARCHAR(3) and Status VARCHAR(10).

   CREATE TABLE Payments (
       PaymentID INT,
       Amount DECIMAL(10,2),
       PaymentDate DATE
   );

   alter table Payments
   add Currency varchar(3),status varchar(10)

   --Tricky one: You need to drop a column MiddleName from Employees, but it's used in a default constraint. 
   --Write the correct sequence of statements to drop the constraint first, then the column.
   --(You'll need to find the constraint name using a system query — try sp_help 'Employees' or query sys.default_constraints.)

   select * from employees
   sp_help employees

   alter table employees
   drop constraint PK__employee__3213E83F6CFC4698

   alter table employees
   drop column middlename

