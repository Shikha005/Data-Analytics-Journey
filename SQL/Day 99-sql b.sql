--Find products whose revenue is greater than the revenue of every product in the same category with a lower price

SELECT
    p1.productid,
    p1.productname,
    p1.category,
    p1.price,
    SUM(o1.quantity * p1.price) AS revenue
FROM product__ p1
JOIN order__ o1
    ON p1.productid = o1.productid
GROUP BY
    p1.productid,
    p1.productname,
    p1.category,
    p1.price
HAVING SUM(o1.quantity * p1.price) > ALL (
    SELECT SUM(o2.quantity * p2.price)
    FROM product__ p2
    JOIN order__ o2
        ON p2.productid = o2.productid
    WHERE p2.category = p1.category
      AND p2.price < p1.price
    GROUP BY p2.productid
);