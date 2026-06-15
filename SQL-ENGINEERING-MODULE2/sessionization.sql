--SESSIONIZATION QUERY --> means grouping user activities based on time gaps
CREATE TABLE user_events(
    user_id INT,
    event_time TIMESTAMP
);

INSERT INTO user_events
VALUES
(1,'2025-01-01 10:00'),
(1,'2025-01-01 10:05'),
(1,'2025-01-01 11:00'),
(1,'2025-01-01 11:10');

-- SELECT
--     user_id,
--     event_time,
--     LAG(event_time)OVER (
--         PARTITION BY user_id
--         ORDER BY event_time
--     ) AS prev_time
-- FROM user_events;

--cxalculating gaps between events
-- SELECT
--     user_id,
--     event_time,
--     LAG(event_time)OVER (
--         PARTITION BY user_id
--         ORDER BY event_time
--     ) AS prev_time
-- FROM user_events;

--cxalculating gaps between events(it will show error as user_events already exist but if we skip code mentioned above than it will run)
SELECT
    user_id,
    event_time,
    LAG(event_time) OVER (
        PARTITION BY user_id
        ORDER BY event_time
    ) AS prev_time,
    event_time -
    LAG(event_time) OVER (
        PARTITION BY user_id
        ORDER BY event_time
    ) AS time_gap
FROM user_events;