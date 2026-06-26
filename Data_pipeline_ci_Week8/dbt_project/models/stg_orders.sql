SELECT
    id AS order_id,
    customer_id,
    status,
    total_amount,
    created_at
FROM {{ source('raw_data', 'orders') }}