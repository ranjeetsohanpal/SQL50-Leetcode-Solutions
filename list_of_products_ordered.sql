WITH cte AS (
    SELECT product_id,SUM(unit) AS unit FROM Orders
    WHERE order_date BETWEEN '2020-02-01' AND '2020-02-29'
    GROUP BY product_id
    HAVING SUM(unit) >= 100
)

SELECT p.product_name,c.unit FROM cte c
INNER JOIN products p ON p.product_id = c.product_id;
