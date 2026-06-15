import pandas as pd
import os

os.makedirs("Data/staging", exist_ok=True)

df = pd.read_json("Data/raw/events.json")
df = df.dropna().drop_duplicates()
df.to_json("Data/staging/clean_events.json", orient="records", indent=4)
print("Staging complete")