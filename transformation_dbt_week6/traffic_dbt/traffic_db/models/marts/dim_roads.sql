select *
from {{ source('raw', 'road_segments') }}