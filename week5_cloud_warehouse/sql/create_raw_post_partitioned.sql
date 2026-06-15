CREATE TABLE raw.posts_2026_06
PARTITION OF raw.posts_partitioned
FOR VALUES FROM ('2026-06-01')
TO ('2026-07-01');

--checking data
SELECT COUNT(*)
FROM raw.posts_partitioned;

SELECT *
FROM raw.posts
LIMIT 5;

--cost-aware query(bad query)
SELECT *
FROM raw.posts_partitioned;

--Correct query

SELECT user_id,title
FROM raw.posts_partitioned
WHERE event_date='2026-06-13';

--Query plan analysis
--bad query 
EXPLAIN ANALYZE
SELECT *
FROM raw.posts_partitioned;
 --correct query
 EXPLAIN ANALYZE
SELECT user_id,title
FROM raw.posts_partitioned
WHERE event_date='2026-06-13';