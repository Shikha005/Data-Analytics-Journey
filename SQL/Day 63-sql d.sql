--Assume a temporary source table called employee_update__ contains updated employee information.
--If an employee already exists, update their salary and status.
--If the employee does not exist, insert them.

CREATE TABLE employee_update__ (
    EmployeeID INT,
    EmployeeName VARCHAR(100),
    Department VARCHAR(50),
    Salary DECIMAL(10,2),
    Status VARCHAR(20)
);

INSERT INTO employee_update__
VALUES
(1, 'Amit Sharma', 'IT', 65000, 'Active'),
(2, 'Neha Singh', 'HR', 55000, 'Active'),
(5, 'Rohan Verma', 'Sales', 45000, 'Active');

MERGE employee__ AS Target
USING employee_update__ AS Source
ON Target.EmployeeID = Source.EmployeeID

WHEN MATCHED THEN
    UPDATE SET
        Target.Salary = Source.Salary,
        Target.Status = Source.Status

WHEN NOT MATCHED BY TARGET THEN
    INSERT
        (EmployeeID, EmployeeName, Department, Salary, Status)
    VALUES
        (Source.EmployeeID,
         Source.EmployeeName,
         Source.Department,
         Source.Salary,
         Source.Status);