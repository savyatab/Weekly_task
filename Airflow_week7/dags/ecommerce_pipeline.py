from datetime import datetime, timedelta
import os
from airflow import DAG
from airflow.operators.bash import BashOperator

PROJECT_ROOT = os.getenv("AIRFLOW_HOME", "/opt/airflow")

default_args = {
    "owner": "airflow",
    "depends_on_past": False,
    "retries": 3,
    "retry_delay": timedelta(minutes=5),
    "retry_exponential_backoff": True,
    "max_retry_delay": timedelta(minutes=15),
}

with DAG(
    dag_id="ecommerce_pipeline_v2",
    start_date=datetime(2026, 6, 1),
    schedule_interval="@daily",
    catchup=False,
    max_active_runs=1,
    default_args=default_args,
    tags=['capstone']
) as dag:

    # 1. Extract API to Append-Only Raw Landing
    extract_api = BashOperator(
        task_id="extract_api",
        bash_command=f"python {PROJECT_ROOT}/src/extract.py --execution_date " + "{{ ds }}"
    )

    # 2. dbt Staging Layer
    dbt_run_staging = BashOperator(
        task_id="dbt_run_staging",
        bash_command=f"cd {PROJECT_ROOT}/ecommerce_dbt && dbt run --select staging --profiles-dir . --vars 'execution_date: {{ ds }}'"
    )

    # 3. dbt Marts Layer (Upsert/Incremental updates)
    dbt_run_marts = BashOperator(
        task_id="dbt_run_marts",
        bash_command=f"cd {PROJECT_ROOT}/ecommerce_dbt && dbt run --select marts --profiles-dir . --vars 'execution_date: {{ ds }}'"
    )

    extract_api >> dbt_run_staging >> dbt_run_marts