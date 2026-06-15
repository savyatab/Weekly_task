# PARTITIONING
--> Split table by a column (usually date)
--> DATA IS PHYSCICALLY DIVIDED INTO CHUNKS.
Example:
CREATE TABLE events (
  event_id INT,
  event_time TIMESTAMP
)
PARTITION BY DATE(event_time);

# CLUSTERING
--> Sort data inside partitions based on columns.
-->Further organizes data inside partition
Example:
CREATE TABLE events (
  event_id INT,
  user_id INT,
  event_type STRING,
  event_time TIMESTAMP
)
PARTITION BY DATE(event_time)
CLUSTER BY user_id;

Partition = big folders
Clustering = sorted pages inside folder

# Cost Models:
Bytes scanned -->used by Google Cloid BigQuery(GCB)
* will pay for how much data your query reads
* scans TB
* reduces data scan

# Warehouse-house
* compute time (Snowflake)
* will pay for how much compute runs(runs longer)
* reduces runtime