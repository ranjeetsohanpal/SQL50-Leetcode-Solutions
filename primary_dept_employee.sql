WITH dept_count AS
(
    SELECT employee_id, COUNT(department_id) AS n_dept FROM Employee
    GROUP BY employee_id
)
SELECT e1.employee_id,
SUM(CASE WHEN d.n_dept > 1 THEN e2.department_id ELSE e1.department_id END) AS department_id
FROM Employee e1
LEFT JOIN Employee e2 ON e1.employee_id = e2.employee_id 
AND e1.department_id = e2.department_id
AND e1.primary_flag = 'Y'
LEFT JOIN dept_count d ON e1.employee_id = d.employee_id
GROUP BY e1.employee_id;
