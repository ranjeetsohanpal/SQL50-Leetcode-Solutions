SELECT ROUND(COUNT(CASE WHEN order_date = customer_pref_delivery_date THEN 1
                END)*100.0/COUNT(*), 2) AS immediate_percentage FROM Delivery
WHERE order_date IN
(SELECT MIN(order_date) FROM Delivery GROUP BY customer_id);