import pandas as pd
import os

os.makedirs("Data/parquet", exist_ok=True)
df = pd.read_json("Data/staging/clean_events.json")
df.to_parquet("Data/parquet/events.parquet", index=False) #index=False Prevents Pandas from saving row numbers i.e.Keeps file clean
print("Parquet created")