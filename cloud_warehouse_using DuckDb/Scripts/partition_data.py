import pandas as pd
import os

# read correct file
df = pd.read_parquet("Data/parquet/events.parquet")
# partition by signup_date (NEW COLUMN)
for date in df["signup_date"].unique():

    path = f"Data/parquet/signup_date={date}"
    os.makedirs(path, exist_ok=True)

    part = df[df["signup_date"] == date]

    part.to_parquet(f"{path}/data.parquet", index=False)

print("Partitioning done successfully")