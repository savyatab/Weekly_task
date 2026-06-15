# parquet->Binary, column-based storage format.
#You are doing data engineering or large-scale analytics
import pandas as pd
data ={
    "id":[1,2,3],
    "name":["awan","anjali","adhi"]
    }
df = pd.DataFrame(data)
df.to_parquet("test.parquet")
df2 = pd.read_parquet("test.parquet")

print(df2)