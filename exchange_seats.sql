SELECT CASE WHEN 
id != (SELECT COUNT(*) FROM Seat) AND id % 2 = 1 THEN id + 1
WHEN id % 2 = 0 THEN id - 1
ELSE id END AS id,student
FROM Seat
ORDER BY id;
