{{ config(materialized='view') }}

WITH raw_source AS (
    -- Simulates mapping your arriving append-only JSON logs partition
    SELECT 5001 as order_id, 99 as customer_id, 250.75 as order_amount, '{{ var("execution_date") }}'::TIMESTAMP as order_updated_at
    UNION ALL
    SELECT 5002 as order_id, 14 as customer_id, 45.00 as order_amount, '{{ var("execution_date") }}'::TIMESTAMP as order_updated_at
)

SELECT 
    order_id,
    customer_id,
    order_amount,
    order_updated_at
FROM raw_source