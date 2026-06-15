--CTE(Copmarision table expression)  --> temporary named reult uisng with (temporary table that exists only during query execution )
WITH high_salary AS (
    SELECT * 
    FROM employees
    WHERE salary > 50000
)
SELECT * FROM high_salary ;


-- multiple cte examples 
WITH high_salary AS (
    SELECT * 
    FROM employees
    WHERE salary > 45000
),
it_employees AS (
    SELECT * 
    FROM employees
    WHERE dept_id = 1
)
SELECT * FROM high_salary ;
