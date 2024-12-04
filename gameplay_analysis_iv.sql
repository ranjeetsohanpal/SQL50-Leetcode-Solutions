WITH first_logs AS (
    
    SELECT player_id,MIN(event_date) AS first_login FROM Activity
    GROUP BY player_id
)

SELECT ROUND(COUNT(
    CASE WHEN a.event_date = f.first_login + INTERVAL '1 day' THEN 1 END)::DECIMAL/COUNT( DISTINCT a.player_id),2) AS fraction  FROM Activity a
JOIN first_logs f ON a.player_id = f.player_id;
