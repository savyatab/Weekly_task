import os
def calculate_tax(amount:float,tax_rate:float)->float:
    if amount < 0:
        raise ValueError("Amount cannot be negative")
    return round(amount * tax_rate , 2)
def run_ingestion():
    #fetch configuration from environment variable
    db_host = os.getenv("DB_HOST","localhost")
    print(f"Connecting to data warehouse at {db_host}....")
    #pipeline extraction logic goes here
    print("Ingestion execution completed successfully")
if __name__ =="__main__":
    run_ingestion()


    
    
