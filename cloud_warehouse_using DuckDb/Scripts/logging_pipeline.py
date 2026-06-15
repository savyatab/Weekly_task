import logging
import os

# create logs folder first
os.makedirs("logs", exist_ok=True)

logging.basicConfig(
    filename="logs/pipeline.log",
    level=logging.INFO,  #controls what messages are saved
    format="%(asctime)s - %(levelname)s - %(message)s"  #asctime->timeofevent,levelname->info/error,messages->actual text
)

logging.info("Pipeline started")
logging.info("ETL process running")

print("Logging completed successfully")