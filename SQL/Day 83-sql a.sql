--Find the total quantity sold for each category

SELECT
    p.category,
    SUM(o.quantity) AS total_quantity
FROM product__ p
JOIN order__ o
    ON p.productid = o.productid
GROUP BY p.category;

--Find products with a profit per unit greater than ₹500

SELECT
    productid,
    productname,
    price,
    costprice,
    price - costprice AS profit_per_unit
FROM product__
WHERE price - costprice > 500;