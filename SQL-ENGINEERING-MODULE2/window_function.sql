--WINDOWS FUNCTION -->Calculates result across rows without collapsing them.

-->ROW_number -->Assign a unique sequential number to each row (no duplicates)
--Use Case--> unique ranking
SELECT
    emp_name,
    salary,
    ROW_NUMBER() OVER (ORDER BY salary DESC) AS row_num
FROM employees;

--Rank -->Ranking with gaps (i.e same value with same rank but next rank is skipped)
--Use case -->competition ranking
SELECT
    emp_name,
    salary,
    RANK() OVER (ORDER BY salary DESC) AS rnk
FROM employees;


--Dense_RANK--> ranking without gap
-->use case-->clean ranking
SELECT
    emp_name,
    salary,
    Dense_RANK() OVER (ORDER BY salary DESC) AS dense_rnk
FROM employees;

-->sum()-->running total (calculates cummulative sum over ordered rows)
--Use case-->Running total
SELECT
    emp_id,
    sale_date,
    sale_amount,
    Sum(sale_amount) OVER (ORDER BY sale_date ) AS running_total
FROM sales;

--Latest record per employee 
--WINDOWS FUNCTION -->Calculates result across rows without collapsing them.


-->ROW_number -->Assign a unique sequential number to each row (no duplicates)
--Use Case--> unique ranking
SELECT
    emp_name,
    salary,
    ROW_NUMBER() OVER (ORDER BY salary DESC) AS row_num
FROM employees;

--Rank -->Ranking with gaps (i.e same value with same rank but next rank is skipped)
--Use case -->competition ranking
SELECT
    emp_name,
    salary,
    RANK() OVER (ORDER BY salary DESC) AS rnk
FROM employees;


--Dense_RANK--> ranking without gap
-->use case-->clean ranking
SELECT
    emp_name,
    salary,
    Dense_RANK() OVER (ORDER BY salary DESC) AS dense_rnk
FROM employees;

-->sum()-->running total (calculates cummulative sum over ordered rows)
--Use case-->Running total
SELECT
    emp_id,
    sale_date,
    sale_amount,
    Sum(sale_amount) OVER (ORDER BY sale_date ) AS running_total
FROM sales;

--Latest record per employee 
SELECT *
FROM(
     SELECT *,
     ROW_NUMBER() OVER(PARTITION BY emp_id
     ORDER BY sale_date DESC
     ) rn  -->alias for row_number
     FROM sales  
) t  -- t--> table alias (temporary name)
WHERE rn = 1; 

