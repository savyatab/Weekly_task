import os
import json
import argparse
import logging

logging.basicConfig(level=logging.INFO, format='%(asctime)s [%(levelname)s] - %(message)s')
logger = logging.getLogger("ingestion_layer")

def check_data_contract(record: dict) -> bool:
    """Enforces boundaries at source boundaries."""
    required_fields = {"order_id", "customer_id", "amount", "updated_at"}
    return required_fields.issubset(record.keys())

def extract_and_land(execution_date: str):
    logger.info(f"Starting pipeline extraction for logic date: {execution_date}")
    
    # Mock source transactional feed for the targeted execution date window
    raw_api_response = [
        {"order_id": 5001, "customer_id": 99, "amount": 250.75, "updated_at": f"{execution_date}T08:12:00Z"},
        {"order_id": 5002, "customer_id": 14, "amount": 45.00, "updated_at": f"{execution_date}T19:45:00Z"}
    ]
    
    # Validate payload records against schema contract
    validated_records = []
    for record in raw_api_response:
        if check_data_contract(record):
            validated_records.append(record)
        else:
            logger.error(f"Data contract violation found on record: {record}")
            raise ValueError("Data format variance caught at ingress boundary.")
            
    # Save to an append-only landing zone partition
    target_dir = f"/opt/airflow/logs/raw_landing/orders/partition_date={execution_date}"
    os.makedirs(target_dir, exist_ok=True)
    
    with open(os.path.join(target_dir, "data.json"), "w") as f:
        json.dump(validated_records, f, indent=4)
        
    logger.info(f"Landed {len(validated_records)} validated logs into: {target_dir}")

if __name__ == "__main__":
    parser = argparse.ArgumentParser()
    parser.add_argument("--execution_date", required=True)
    args = parser.parse_args()
    extract_and_land(args.execution_date)