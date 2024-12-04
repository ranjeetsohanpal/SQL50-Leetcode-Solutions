(
    SELECT u.name AS results FROM MovieRating r
    JOIN Users u ON r.user_id = u.user_id
    GROUP BY u.name
    ORDER BY COUNT(r.movie_id)DESC,u.name LIMIT 1
)

UNION ALL 

(
    SELECT m.title FROM MovieRating r
    JOIN Movies m ON m.movie_id = r.movie_id
    WHERE created_at BETWEEN '2020-02-01' AND '2020-02-29'
    GROUP BY m.title
    ORDER BY AVG(rating) DESC,m.title ASC LIMIT 1 
)
