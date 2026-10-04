--Compare each product's price with the previous product price

SELECT productid,productname,price,
LAG(price) OVER (ORDER BY price) AS previous_price,price - LAG(price) OVER (ORDER BY price) AS price_difference
FROM product__;

--Find the top 2 products by sales in each category

WITH product_sales AS (
    SELECT
        p.productid,
        p.productname,
        p.category,
        SUM(o.quantity * p.price) AS total_sales
    FROM product__ p
    JOIN order__ o
        ON p.productid = o.productid
    GROUP BY p.productid, p.productname, p.category
),
ranked_products AS (
    SELECT
        *,
        ROW_NUMBER() OVER (
            PARTITION BY category
            ORDER BY total_sales DESC
        ) AS sales_rank
    FROM product_sales
)
SELECT
    productid,
    productname,
    category,
    total_sales
FROM ranked_products
WHERE sales_rank <= 2;