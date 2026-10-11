--Calculate each customer's average spending per order

SELECT
    c.customerid,
    c.customername,
    AVG(o.quantity * p.price) AS average_order_value
FROM customer__ c
JOIN order__ o
    ON c.customerid = o.customerid
JOIN product__ p
    ON o.productid = p.productid
GROUP BY c.customerid, c.customername;

--Find products that contribute to more than 15% of their category's revenue

WITH ProductRevenue AS (
    SELECT
        p.productid,
        p.productname,
        p.category,
        SUM(o.quantity * p.price) AS product_revenue
    FROM product__ p
    JOIN order__ o
        ON p.productid = o.productid
    GROUP BY p.productid, p.productname, p.category
)
SELECT
    productid,
    productname,
    category,
    product_revenue,
    ROUND(
        product_revenue * 100.0 /
        NULLIF(
            SUM(product_revenue) OVER (
                PARTITION BY category
            ), 0
        ),
        2
    ) AS category_revenue_percentage
FROM ProductRevenue
WHERE product_revenue * 100.0 /
      NULLIF(
          SUM(product_revenue) OVER (
              PARTITION BY category
          ), 0
      ) > 15;