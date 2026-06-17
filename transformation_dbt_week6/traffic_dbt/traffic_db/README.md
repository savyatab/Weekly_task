# Traffic Data Warehouse Project (dbt)

## Overview
This project builds a modern data transformation pipeline using dbt on PostgreSQL traffic data. It transforms raw traffic data into analytics-ready models for reporting and analysis.

## Project Structure

- staging/ → Clean raw data (stg_vehicle_logs, stg_gps_data)
- intermediate/ → Aggregations and transformations (int_speed_metrics, int_congestion)
- marts/ → Final business tables (fact_traffic, dim_roads)

## Source Data (PostgreSQL)

Raw tables in `raw` schema:
- vehicle_logs
- gps_data
- traffic_data
- road_segments

## Tools Used
- dbt (data build tool)
- PostgreSQL

## How to Run
dbt debug
dbt run
dbt test
dbt docs generate
dbt docs serve
dbt compile
dbt snapshot