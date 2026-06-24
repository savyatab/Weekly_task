{{ config(
    materialized='incremental',
    unique_key='order_id',
    incremental_strategy='merge'
) }}

SELECT 
    order_id,
    customer_id,
    order_amount,
    order_updated_at,
    CURRENT_TIMESTAMP as processed_at
FROM {{ ref('stg_api_orders') }}

{% if is_incremental() %}
    WHERE order_updated_at >= (SELECT MAX(order_updated_at) FROM {{ this }})
{% endif %}