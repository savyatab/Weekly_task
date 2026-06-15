--LATEST RECORD PER PAY -->For each unique entity (key), retrieve only the most recent row based on a date, timestamp, version number, or other ordering column.
SELECT *
FROM (
    SELECT *,
           ROW_NUMBER() OVER (
               PARTITION BY emp_id
               ORDER BY sale_date DESC
           ) AS rn
    FROM sales
) t
WHERE rn = 1;

--deduplication --> removes duplicates
SELECT *
FROM (
    SELECT *,
           ROW_NUMBER() OVER (
               PARTITION BY emp_id, sale_amount, sale_date
               ORDER BY sale_id
           ) AS rn
    FROM sales
) t
WHERE rn = 1;