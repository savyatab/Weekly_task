# Data Built Tool(DBT)
DBT-> SQL + SOFTWARE ENGINEERING + DEPENDENCY GRAPH FOR DATA PIPELINE
->It is a transformed tool that lets you write sql queries to transforem your data directly inside your data warehouse
(It is not a database,doesnot extract or load data)but transforms data that already exists in your warehouse.

SQL Model (sql files)
        ↓
dbt compiles it
        ↓
executes in data warehouse
        ↓
becomes TABLE / VIEW / INCREMENTAL TABLE

# DBT ARCHITECTURE:
    RAW DATA
       ↓
    STAGING/CLEANING LAYER (rename,fix datatypes,remove null)
       ↓
    INTERMEDIATE /LOGIC LAYER(joins,calculations,derived logics)
       ↓
    MARTS / BUSINESS LAYER(final aggregation,star schema creation)
       ↓
    BI/DASHBOARD

# ref()->Used to link one model to another dbt model
   * builds DAG,ensures correct execution order and enables modular pipeline design

# source()->external /raw references of data
   * used to point ti rows tables outside dbt

# lineage :DAG (DATA FLOW TRACT)
    * Visual and logical flow of data from source final model

# documentation(docs)
      * generates auto documentation website for project icludings tests,source,lineage graph,model description

#  Materialization : The strategy by which a Data model is built in warehouse
view -> database view (freshes,no storage,slower query)          
table ->    | physical table (fast queries, more storage)
incremental-> | growing table (best for big growing dataset)      
ephemeral ->  | CTE inside another model (reusable logic,doesnot exist as standalone table)


# INCREMENTAL MODELS
An incremental model processes only new or changed data, instead of rebuilding the entire table every time.
1. is_incremental() → checks if model already exists
2. unique_key → identifies rows
3. Only new/updated records are processed.

# Late-Arriving Data
Late-arriving data is data that comes after its expected time window.
# Handling Late-Arriving Data in dbt
1. Lookback Window 
   Reprocess recent data every run
2. Merge Strategy (Incremental Upsert)
   Use unique_key + update logic:
3. Partition Reprocessing
   Rebuild affected partitions

# Combined Model
Raw Data (may arrive late)
        ↓
Incremental Model (process new + updated rows)
        ↓
Lookback / Merge logic (handles late data)
        ↓
Accurate analytics tables

# DBT TESTS:
ARE RULES THAT VALIDATE DATA QUALITY IN YOUR MODELS
* NOT NULL TEST
    Ensures a column doesnot contain null values
* UNIQUE TEST 
    Ensures all values in column are unique
* ACCEPTED VALUES
     Ensures a column contains only allowed values
* RELATIONSHIP TEST 
     Ensures foreign key relationship is valids


# Freshness checks
Freshness ensures that source data is up-to-date.
Source Data → Timestamp check → Fresh / Stale alert

# Macros in dbt
Macros are reusable SQL functions written in Jinja.

# Packages 
Packages are reusable dbt libraries created by others.

CI Awareness (Continuous Integration)
# CI ->CI ensures that every change in code is tested before merging.
Developer pushes code
        ↓
GitHub Actions / CI tool runs
        ↓
dbt build / dbt test
        ↓
If fail → reject merge
If pass → allow merge

