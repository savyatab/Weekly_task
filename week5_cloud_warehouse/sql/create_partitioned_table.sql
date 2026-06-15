CREATE TABLE raw.posts_partitioned(
    user_id INTEGER,
    post_id INTEGER,
    title TEXT,
    body TEXT,
    event_date DATE
)
PARTITION BY RANGE(event_date);

CREATE TABLE raw.posts_2026_06
PARTITION OF raw.posts_partitioned
FOR VALUES FROM ('2026-06-01')
TO ('2026-07-01');


INSERT INTO raw.posts_partitioned
SELECT *
FROM raw.posts;

