WITH cte AS
(
    SELECT salary,DENSE_RANK() OVER (ORDER BY salary DESC) AS ranking
    FROM Employee
)

SELECT MAX(CASE WHEN ranking < 2 THEN NULL ELSE salary END) AS SecondHighestSalary
FROM cte;
