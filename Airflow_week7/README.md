# E-Commerce Idempotent ELT Pipeline with Apache Airflow
This repository contains a production-grade orchestration pipeline designed using Apache Airflow. The workflow orchestrates an ELT (Extract, Load, Transform) pattern to securely extract daily e-commerce order data, enforce raw landing zone data contracts, load data into a central warehouse using an idempotent strategy, and trigger dbt for dimensional modeling.

# Architecture & Workflow Overview
The architecture follows a warehouse-first design, prioritizing raw data preservation before transforming within the analytical database.

  [ External API ] 
         │
         ▼  (Step 1: api_extraction)
  [ Local Storage / Landing Zone ] ➔ (.json format)
         │
         ▼  (Step 2: FileSensor)
  [ File Integrity Verified ]
         │
         ▼  (Step 3: warehouse_load_stage)
  [ Data Warehouse Staging ] ➔ (Idempotent SQL Atomic Overwrite)
         │
         ▼  (Step 4: dbt_transform)
  [ Production Data Marts ] ➔ (Cleaned Analytics Layer for BI)
Core Execution Steps
Extract (api_extraction): Fetches incremental transactional data directly from an external e-commerce API. Rather than pulling arbitrarily by execution time, it leverages Airflow's deterministic context data boundaries (data_interval_start and data_interval_end).

Verify (wait_for_raw_file): A file sensor that acts as a structural data contract gate. It blocks downstream database writes if the upstream API payload failed to land safely or is corrupted.

Load (warehouse_load_stage): Executes an atomic write operation within the warehouse using dynamic {{ ds }} Jinja macros. It performs a preemptive purge of the current day's partition before inserting new records to completely neutralize duplicate risk.

Transform (dbt_transform): Triggers a dbt compilation run that materializes raw JSON strings into structured, performance-tuned analytics layers (marts_orders) optimized for downstream business intelligence tools.

# Core Pipeline Fail-safes
Automated Self-Healing: Configured with a retry back-off window. Upstream transient errors (network drops, API rate limiting) trigger a automatic 5-minute cooldown up to 2 times before escalating.

SLA Breach Monitoring: Integrated with an absolute 1-hour Service Level Agreement (SLA). Runs extending beyond this window automatically route emergency diagnostic reports to alerts@company.com.

Safe Historical Reprocessing: catchup=True is enabled. If deployed retroactively, Airflow schedules sequential, non-overlapping historical DAG runs, bounded safely by execution intervals to prevent resource choking.

Local Setup & Environment Provisioning
Prerequisites
Docker (Desktop or Engine)

Docker Compose v2.0+

Minimum resource allocation: 4GB RAM, 2 Cores

1. Initialize Local Directory Structure
Instead of mkdir -p and Linux-specific user IDs (id -u), Windows uses New-Item to generate directories and assigns a standard fixed block container ID (50000) for the Airflow environment:

PowerShell
New-Item -ItemType Directory -Force -Path .\dags, .\logs, .\plugins, .\data
Set-Content -Path .env -Value "AIRFLOW_UID=50000"
2. Download Docker Compose Manifest
Instead of curl, PowerShell utilizes Invoke-WebRequest to fetch the stable orchestration manifest file from the remote Airflow server:

PowerShell
Invoke-WebRequest -Uri "https://airflow.apache.org/docs/apache-airflow/stable/docker-compose.yaml" -OutFile "docker-compose.yaml"
3. Database & System Initialization
This command remains identical across all systems as it communicates directly through the abstraction layer of the Docker engine:

PowerShell
docker compose up airflow-init
4. Deploy the Stack
Spin up the service stack (Scheduler, Webserver, Worker, and Triggerer) to run persistently in background detached mode:

PowerShell
docker compose up -d
5. Accessing the Environment
Once the containers report a healthy status, you can open your web browser to manage your schedules.

Web UI URL: http://localhost:8080

Default Credentials: Username: ..... | Password: .....

# Command 1: Unlocking/Triggering the Pipeline via PowerShell
To unpause and trigger your DAG run instantly without clicking the web dashboard UI:
PowerShell
docker compose exec airflow-worker airflow dags unpause ecommerce_pipeline_v1
docker compose exec airflow-worker airflow dags trigger ecommerce_pipeline_v1

# Command 2: Testing Pipeline Idempotency & Backfills
Run historical executions over a specific two-week block to confirm rows don't duplicate:
PowerShell
docker compose exec airflow-worker airflow dags backfill --start-date 2026-05-01 --end-date 2026-05-15 --reset-dagruns ecommerce_pipeline_v1

# Command 3: Auditing Pipeline Task Failure Logs
If a specific day fails, read the terminal output directly:
PowerShell
docker compose exec airflow-worker airflow tasks logs ecommerce_pipeline_v1 api_extraction 2026-06-23
