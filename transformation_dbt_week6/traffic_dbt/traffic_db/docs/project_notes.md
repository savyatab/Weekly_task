models:
  - name: int_speed_metrics
    description: >
      This model calculates aggregated traffic metrics per road,
      including average speed and total vehicle count derived from vehicle logs.

    columns:
      - name: road_id
        description: Unique identifier for each road segment

      - name: avg_speed
        description: Average speed of vehicles per road

      - name: vehicle_count
        description: Total number of vehicle records per road