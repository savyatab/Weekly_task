-- Current record
SELECT *
FROM dim_customer_scd2
WHERE is_current = TRUE;

-- History tracking
SELECT *
FROM dim_customer_scd2
WHERE customer_id = 1
ORDER BY valid_from;