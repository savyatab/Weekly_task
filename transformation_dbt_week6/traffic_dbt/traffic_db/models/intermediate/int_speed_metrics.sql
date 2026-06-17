select
    road_id,
    avg(speed) as avg_speed,
    count(*) as vehicle_count
from {{ ref('stg_vehicle_logs') }}
group by road_id