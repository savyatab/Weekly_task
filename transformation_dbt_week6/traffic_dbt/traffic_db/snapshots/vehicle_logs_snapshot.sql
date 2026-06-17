{% snapshot vehicle_logs_snapshot %}

{{
    config(
        target_schema='snapshots',
        unique_key='vehicle_id',
        strategy='check',
        check_cols=['speed', 'road_id']
    )
}}

select *
from {{ source('raw', 'vehicle_logs') }}

{% endsnapshot %}