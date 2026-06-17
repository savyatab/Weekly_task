-- analyses->are a sql file that arenot a part of dbt run pipeline
select
    road_id,
    avg(speed)
from raw.vehicle_logs
group by road_id;


