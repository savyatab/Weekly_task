select
    vehicle_id,
    road_id,
    speed,
    timestamp
from {{ source('raw', 'gps_data') }}