--Design challenge: Create a table Feedback where a column Rating should conceptually only allow values 1 to 5.
--Since we haven't formally covered CHECK constraints yet (Day 4), just write your best attempt at restricting
--this using a data type or comment where you would add a constraint — we'll revisit and correct this exact question on Day 4.

CREATE TABLE Feedback (
    FeedbackID INT PRIMARY KEY,
    Rating TINYINT,  -- best data type choice: smallest integer type that fits 1–5
    Comments VARCHAR(200)
    -- We cannot truly *restrict* values to 1–5 using data type alone.
    -- TINYINT only limits the range to 0–255, not specifically 1–5.
    -- To actually enforce "only 1 to 5", we need a CHECK constraint:
    -- CONSTRAINT CHK_Rating CHECK (Rating BETWEEN 1 AND 5)
    -- We'll add this properly on Day 4 when we cover constraints.
);

select * from Feedback