# DataWare house
--> A big database optimized for analytics (not apps).
Example: Google BigQuery,Snowflake
Importance:
1. It stores structured data.
2. Run SQL on large datasets.
3. It is faster for analytics than normal databases.

# Object Storage(S3/GCS)
--> Where raw files lives
# TRADITIONAL DATABASE CONTAINS STORAGE AND COMPUTE IN SAME SERVER.
   Examples :MySQL, PostgreSQL

# CLOUD DATABASE:
               STORAGE
           /     |      \
    COMPUTE  COMPUTE  COMPUTE

* STORAGE LAYER : stores data permanently (your Parquet files in S3/GCS)
      * Big query : Managed Layer
      * Snowflake : Cloud Storage Behind the scenes
        S3 / GCS / Parquet files

* COMPUTE LAYER : warehouse engine that reads them, use compute only when querying.
BigQuery engine / Snowflake warehouse

# Big Query :
--> uses slots instead of virtual warehouse.
--> A slot is a unit of compute.
--> charged for data scans.
              Query
                |   
             Uses slots
                |
             Read Data
                |
            Returns Results
# Snowflake Virtual Warehouses
--> is a compute cluster used for queries and data loading.
* Storage layer (data stored in cloud like S3)
* Compute layer (virtual warehouses)
* Cloud services layer (metadata, security)
