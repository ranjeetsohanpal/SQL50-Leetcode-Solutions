WITH cte AS
(
    SELECT * FROM Accounts
    WHERE income < 20000
),
cte2 AS
(
    SELECT * FROM Accounts
    WHERE income BETWEEN 20000 AND 50000
),
cte3 AS
(
    SELECT * FROM Accounts
    WHERE income > 50000
)

SELECT 'Low Salary' AS category,COUNT(*) AS accounts_count
FROM cte
UNION
SELECT 'Average Salary' AS category,COUNT(*) AS accounts_count
FROM cte2
UNION 
SELECT 'High Salary' AS category,COUNT(*) AS accounts_count
FROM cte3;
