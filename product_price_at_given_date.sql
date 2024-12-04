WITH prod_cte AS
(
    SELECT DISTINCT product_id FROM Products
    ORDER BY product_id ASC

),
prices_cte AS (
    SELECT DISTINCT product_id,
    LAST_VALUE(new_price) OVER
    (
        PARTITION BY product_id
        ORDER BY change_date ASC
    ) AS price,change_date
    FROM Products
    WHERE change_date <= '2019-08-16'
    ORDER BY product_id,change_date
    
),
latest_prices AS 
(
    SELECT prod.product_id,
    CASE WHEN prices.price IS NULL THEN 10 ELSE prices.price END AS price FROM prod_cte AS prod
    LEFT JOIN prices_cte AS prices ON prod.product_id = prices.product_id
)
SELECT DISTINCT product_id,
LAST_VALUE(price) OVER
(
    PARTITION BY product_id
) AS price
FROM latest_prices
ORDER BY product_id;
