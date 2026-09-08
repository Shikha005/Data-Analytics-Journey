--Increase the price of all products in the Electronics category by 10%.

UPDATE product__
SET Price = Price * 1.10
WHERE Category = 'Electronics';

--Increase the salary of all IT employees by 15%.

UPDATE customer__
SET Status = 'Premium'
WHERE City = 'Bhopal';

--Delete all products whose stock is 0.

DELETE FROM product__
WHERE Stock = 0;