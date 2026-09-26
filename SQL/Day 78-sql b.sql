--Find the most expensive product in each category

SELECT p.category,p.productname,p.price
FROM product__ p
WHERE p.price = (
    SELECT MAX(p2.price)
    FROM product__ p2
    WHERE p2.category = p.category
);

--Find customers whose total quantity ordered is greater than 10

SELECT c.customerid,c.customername,
SUM(o.quantity) AS total_quantity
FROM customer__ c JOIN order__ o
ON c.customerid = o.customerid
GROUP BY c.customerid, c.customername
HAVING SUM(o.quantity) > 10;