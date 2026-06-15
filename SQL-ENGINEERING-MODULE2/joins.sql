--INNER JOIN -->MATCHING ROWS ONLY
SELECT e.emp_name,d.dept_name
FROM employees e
INNER JOIN departments d
ON e.dept_id = d.dept_id;

--LEFT JOIN -->all left table and matching right

SELECT e.emp_name, d.dept_name
FROM employees e
LEFT JOIN departments d
ON e.dept_id = d.dept_id;

-- FULL OUTER JOIN
SELECT e.emp_name, d.dept_name
FROM employees e
FULL OUTER JOIN departments d
ON e.dept_id = d.dept_id;

--Right JOIN--> ALL RIGHT AND MATCHING LEFT
SELECT e.emp_name, d.dept_name
FROM employees e
RIGHT JOIN departments d
ON e.dept_id = d.dept_id;
