select
    vehicle_id,
    road_id,

    coalesce(speed, 0) as speed,

    timestamp

from {{ source('raw', 'vehicle_logs') }}
where road_id is not null