WITH daily_rev AS
(
    -- Purpose of this query is to sum all the revenue for each day
    SELECT visited_on,SUM(amount) AS amount FROM Customer
    GROUP BY visited_on
),
cte AS (
    SELECT visited_on,
    SUM(amount) OVER (ORDER BY visited_on ROWS BETWEEN 6 PRECEDING AND CURRENT ROW) AS amount,
    ROUND(AVG(amount) OVER (ORDER BY visited_on ROWS BETWEEN 6 PRECEDING AND CURRENT ROW),2) AS average_amount,
    ROW_NUMBER() OVER (ORDER BY visited_on) AS row_num
    FROM daily_rev
)

SELECT visited_on,amount,average_amount FROM cte
WHERE row_num >= 7;
