--Find the second-highest product price

SELECT MAX(price) AS second_highest_price
FROM product__
WHERE price < (SELECT MAX(price) FROM product__);

--Find customers who ordered every product in the Electronics category

SELECT c.customerid,c.customername
FROM customer__ c
WHERE NOT EXISTS (
    SELECT 1
    FROM product__ p
    WHERE p.category = 'Electronics'
      AND NOT EXISTS (
          SELECT 1
          FROM order__ o
          WHERE o.customerid = c.customerid
            AND o.productid = p.productid
      )
);