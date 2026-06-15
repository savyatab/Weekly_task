--INDEXES-->speeds up searching 
-- ;CREATE INDEX idx_emp_salary
-- ON employees(salary);

-- SELECT *
-- FROM employees
-- WHERE salary = 50000;

--PARTITIONING(WATRHOUSE/BIG TABLES)
-->Partitioning splits a large table into smaller logical pieces (partitions)
--TYPES --> RANGE PARTITION (BASED ON DATES),LIST(BASED ON CATEGORY),HASH PARTITION 

SELECT
    emp_name,
    dept_id,
    salary,
    AVG(salary) OVER (PARTITION BY dept_id) AS avg_dept_salary
FROM employees;


SELECT
    emp_name,
    dept_id,
    salary,
    RANK() OVER (
        PARTITION BY dept_id
        ORDER BY salary DESC
    ) AS dept_rank
FROM employees;