--EXPLAIN--> SHOWS PLANNED EXECUTION BUT DOESNOT RUN QUERY
-- EXPLAIN 
-- SELECT *
-- FROM sales;  -- shows estimated cost,rows,choosen width....


--Explain ANALYZE ---> RUNS QUERY AND SHOWS REAL EXECUTION STASTICS (actual loops count,actual rows processed,real execution time)
EXPLAIN ANALYZE
SELECT * 
FROM employees e
JOIN sales s
ON e.emp_id = s.emp_id