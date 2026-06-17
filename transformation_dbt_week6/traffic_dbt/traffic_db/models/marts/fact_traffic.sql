{{ config(
    materialized='incremental',
    unique_key='road_id'
) }}

select
    road_id,

    avg(speed) as avg_speed,

    count(*) as vehicle_count,

    case
        when avg(speed) < 30 then 'HIGH'
        when avg(speed) < 60 then 'MEDIUM'
        else 'LOW'
    end as congestion_level

from {{ ref('stg_vehicle_logs') }}

group by road_id