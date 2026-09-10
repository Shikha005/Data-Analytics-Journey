--Find products whose price is greater than the maximum price of products belonging to a specified category.
SELECT 
    ProductID,
    ProductName,
    Price,
    Category
FROM Product__
WHERE Price > (
    SELECT MAX(Price)
    FROM Product__
    WHERE Category = 'Electronics'
);

--Rank all products from highest price to lowest price.
SELECT 
    ProductID,
    ProductName,
    Price,
    RANK() OVER (ORDER BY Price DESC) AS PriceRank
FROM Product__;