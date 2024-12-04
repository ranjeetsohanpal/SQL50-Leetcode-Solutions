SELECT e1.reports_to AS employee_id,e2.name,COUNT(e1.age) AS reports_count,
ROUND(AVG(e1.age),0) AS average_age 
FROM Employees e1
JOIN Employees e2 ON e1.reports_to = e2.employee_id
GROUP BY e1.reports_to,e2.name
ORDER BY e1.reports_to; 
