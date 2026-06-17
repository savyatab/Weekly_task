select
    road_id,
    avg(speed) as avg_speed,
    case
        when avg(speed) < 30 then 'HIGH'
        when avg(speed) between 30 and 60 then 'MEDIUM'
        else 'LOW'
    end as congestion_level
from {{ ref('stg_gps_data') }}
group by road_id