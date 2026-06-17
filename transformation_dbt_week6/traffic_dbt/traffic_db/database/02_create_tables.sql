create table raw.gps_data (
    vehicle_id int,
    road_id int,
    speed int,
    timestamp timestamp
);

create table raw.road_segments (
    road_id int,
    road_name text,
    city text
);

create table raw.vehicle_logs (
    vehicle_id int,
    road_id int,
    speed int,
    timestamp timestamp
);

create table raw.traffic_data (
    road_id int,
    vehicle_count int,
    timestamp timestamp
);