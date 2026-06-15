import pandas as pd
df = pd.read_json("Data/raw/events.json")
print("Null Values:\n",df.isnull().sum())
print("Duplicates:", df.duplicated().sum())
print("Shape:", df.shape)