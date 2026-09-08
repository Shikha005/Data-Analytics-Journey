CREATE TABLE customer__ (
    CustomerID INT PRIMARY KEY,
    CustomerName VARCHAR(100),
    City VARCHAR(50),
    Status VARCHAR(20)
);

CREATE TABLE order__ (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    ProductID INT,
    OrderDate DATE,
    Amount DECIMAL(10,2),
    Status VARCHAR(20),

    FOREIGN KEY (CustomerID)
    REFERENCES customer__(CustomerID)
);

CREATE TABLE product__ (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(100),
    Category VARCHAR(50),
    Price DECIMAL(10,2),
    Stock INT
);

CREATE TABLE employee__ (
    EmployeeID INT PRIMARY KEY,
    EmployeeName VARCHAR(100),
    Department VARCHAR(50),
    Salary DECIMAL(10,2),
    Status VARCHAR(20)
);

--Insert a new customer named Rahul Sharma, from Bhopal, with status Active.

INSERT INTO customer__
    (CustomerID, CustomerName, City, Status)
VALUES
    (101, 'Rahul Sharma', 'Bhopal', 'Active');

--Insert three new products into product__ belonging to different categories.

INSERT INTO product__
    (ProductID, ProductName, Category, Price, Stock)
VALUES
    (201, 'Wireless Mouse', 'Electronics', 850, 40),
    (202, 'Office Chair', 'Furniture', 6500, 15),
    (203, 'Notebook', 'Stationery', 120, 100);

--Insert a new order for customer 101 for product 201, with an amount of ₹850 and status Pending.

INSERT INTO order__
    (OrderID, CustomerID, ProductID, OrderDate, Amount, Status)
VALUES
    (301, 101, 201, GETDATE(), 850, 'Pending');