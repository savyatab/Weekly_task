import pandas as pd
import os

os.makedirs("Data/raw", exist_ok=True)
# user-based dataset
data = [
    [1, "Ram", "Kathmandu", "active", "2026-06-01"],
    [2, "Sita", "Pokhara", "inactive", "2026-06-02"],
    [3, "Hari", "Butwal", "active", "2026-06-03"],
    [4, "Rehana", "Dang", "active", "2026-06-05"],
    [5, "Amrit", "Chitwan", "inactive", "2026-06-03"]
]

df = pd.DataFrame(
    data,
    columns=["user_id", "name", "city", "status", "signup_date"]
)
df.to_json(
    "Data/raw/events.json",
    orient="records",
    indent=4
)
print("Raw users data created successfully")