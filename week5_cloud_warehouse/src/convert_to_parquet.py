import pandas as pd
from pathlib import Path
from datetime import date
df = pd.read_json("data/raw/posts.json")

df.rename(
    columns={
        "userId": "user_id",
        "id": "post_id"
    },
    inplace=True
)

today = date.today().strftime("%Y-%m-%d")

df["event_date"] = today

partition_path = Path(
    f"data/parquet/event_date={today}"
)

partition_path.mkdir(
    parents=True,
    exist_ok=True
)

output_file = partition_path / "posts.parquet"

df.to_parquet(
    output_file,
    engine="pyarrow",
    index=False
)
print("Parquet created")