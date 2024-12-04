WITH first_prices AS 
(
    SELECT product_id,MIN(year) AS year1 FROM Sales
    GROUP BY product_id
) 

SELECT s.product_id,s.year AS first_year, quantity, price
FROM Sales s 
JOIN first_prices f ON s.product_id = f.product_id
WHERE s.year = f.year1;
