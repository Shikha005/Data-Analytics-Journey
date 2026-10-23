--Find the percentage of products that have never been sold

SELECT
    COUNT(*) AS total_products,
    SUM(
        CASE
            WHEN NOT EXISTS (
                SELECT 1
                FROM order__ o
                WHERE o.productid = p.productid
            )
            THEN 1 ELSE 0
        END
    ) AS unsold_products,
    ROUND(
        SUM(
            CASE
                WHEN NOT EXISTS (
                    SELECT 1
                    FROM order__ o
                    WHERE o.productid = p.productid
                )
                THEN 100.0 ELSE 0
            END
        ) / NULLIF(COUNT(*), 0),
        2
    ) AS unsold_percentage
FROM product__ p;