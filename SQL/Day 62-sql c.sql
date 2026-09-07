--Write a query using system catalog views (INFORMATION_SCHEMA.COLUMNS) to list all column names, data types,
--and max lengths for the Employees table — without opening table design manually. This is a very 
--common "how do you check table structure via query" interview task.

SELECT 
    COLUMN_NAME,
    DATA_TYPE,
    CHARACTER_MAXIMUM_LENGTH
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'Employees';

--Scenario: You accidentally ran TRUNCATE TABLE Employees in production without a transaction. 
--Write the steps/approach (in comments, since actual recovery depends on backups) you would take 
--to recover the data — and separately, write how you should have written it safely using a 
--transaction wrapper (BEGIN TRAN...TRUNCATE...ROLLBACK/COMMIT) to test its effect safely first.

BEGIN TRANSACTION;

TRUNCATE TABLE Employees;

-- Check the effect safely
SELECT COUNT(*) AS EmployeeCount
FROM Employees;

-- If everything looks wrong:
ROLLBACK TRANSACTION;

