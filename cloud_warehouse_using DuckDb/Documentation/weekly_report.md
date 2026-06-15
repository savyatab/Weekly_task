WEEK 5 REPORT — Cloud Warehouse & Object Storage

## Objective
To understand how modern data platforms store, transform, and query analytical data using object storage, partitioning, and warehouse systems.

## Key Concepts Learned
- Object storage (S3/GCS simulation using local folders)
- Data warehouse basics using DuckDB
- Separation of raw, staging, and processed data layers
- File formats: JSON and Parquet
- Partitioning using signup_date folders
- Cost-aware SQL querying
- Basic IAM concepts
- Logging system in ETL pipelines
- ETL workflow (Extract, Transform, Load)

## Practical Tasks Performed

### 1. Raw Data Creation
- Created users.json dataset
- Simulated API-style data ingestion

### 2. Data Validation & Cleaning
- Checked missing values
- Removed duplicate records
- Created clean staging dataset

### 3. Parquet Conversion
- Converted JSON data into Parquet format
- Improved storage efficiency and query performance

### 4. Data Partitioning
- Partitioned data using signup_date
- Created folder structure:
  signup_date=YYYY-MM-DD

### 5. Warehouse Loading
- Loaded partitioned Parquet files into DuckDB
- Created raw_users table for analytics

### 6. Cost-Aware Queries
- Used filtered queries using signup_date
- Avoided full table scans
- Improved query efficiency
### 7. Query Optimization Practice
- Compared:
  - SELECT * (bad practice)
  - Filtered and grouped queries (optimized)

### 8. Metadata Tracking
- Stored table metadata like row count and load date
### 9. IAM Simulation
- Simulated access roles:
  - analyst
  - engineer
  - admin

### 10. Logging Pipeline
- Implemented logging using Python logging module
- Stored pipeline logs in logs/pipeline.log

## Tools Used
- Python (Pandas)
- DuckDB (Warehouse simulation)
- Parquet (Columnar storage)
- OS module (file handling)
- Logging module

## Final Outcome
Built a complete mini data engineering pipeline:

Raw → Staging → Parquet → Partitioned Storage → Warehouse → SQL Analytics

## Key Takeaway
This project simulates real-world cloud data platforms like BigQuery and Snowflake, focusing on data ingestion, transformation, storage optimization, and querying efficiency.
