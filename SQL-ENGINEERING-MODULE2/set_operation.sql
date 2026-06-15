--Set Operation--> combines reult from multiple queries
--UNION -->Combines result from two queries and remove duplicates

-- SELECT emp_name FROM employees
-- UNION
-- SELECT dept_name FROM departments;


--Union All -->keeps duplicates
-- SELECT emp_name FROM employees
-- UNION ALL
-- SELECT dept_name FROM departments;


--intersect --> common rows

-- SELECT emp_name FROM employees
-- INTERSECT
-- SELECT dept_name FROM departments;

-->EXCEPT--> differences

SELECT emp_name FROM employees
EXCEPT
SELECT dept_name FROM departments;


