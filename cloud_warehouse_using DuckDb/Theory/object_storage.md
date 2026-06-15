# Object Storage:
Stores data as objects (file + metadata)instead of rows and blocks
- Data(file content)
- Metadata (size,type,timestamp)
- Unique key (path name)
Access -->HTTP API
Use case--> Analytics(Data Lakes)

S3 (AWS)-->used with Redshift,EMR,Athena
GCS(Google Cloud Storage)-->Integrated with Big query(simple data lake setup)

# Buckets: A root folder in cloud storage
-->top level container for storing data

# Prefixes
-->are like virtual folders inside buckets.
Example: 
      gs;//bucket/raw/2026/06/01.parquet
                  |                |
                prefix          object

Why prefix matter?
* They help with organizing,partitioning,quey filtering and life cycles rules

# Techincally there are no real folders in object storage

# File formats :
* csv(avoid)-->no schema,slow 
# read slow write fast 
* JSON- good for APIs but not ideal for analytics
* Auro - supports schema,compression,nested structure(used in straming system)
* Parquet- an open source columnar storage file format that delivers c   exceptional compression and query performance for big data anlytis workloads.
# Write slow read fast

# WHy parquet won?
csv reads 100 columns where as parquet reads 2 columns and ignore all 

# Loading data 
-->It defines how data moves from files/APIs/Streams into analytics tables

1. Copy(Batch Loading)
--> used when you load large files in bulk from object storage (S#/GCS) into warehousre table.It is used when:
* you have csv/parquet files  already in storage
* daily/hourly ETL pipeline
* historical back file

2. External tables (query without loading)
-->allows you to query data directly from objects storage without importin it in warehouse dtorage.It is used when:
* Quick access to raw data
* data is still in lakes, is frequently changing,debuuging

3.Streaming Inserts (Real Time loading)
--> used when data arrives continously.It is used when:
 * Real Time traffic dashboard
 * Fraud detection
 * IOT systems

 # IAM (Identity and access Management)
 -->used in Google Cloud ,AWS,snowflake,etc
 -->decides Who can access what

 User-> Role -> Permisiion ->resource


 # Service accounts
 ->used heavily in cloud pipelines
 -> is a non human Identity Used by application

 # least Privilege Principle
 -> Give only permission needed nothing extra.

     IAM
      |
    Service account
      |
Least Privilege Permission
      | 
Secret Manager(Credentials)
