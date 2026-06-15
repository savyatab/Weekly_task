import pandas as pd
from sqlalchemy import create_engine
from dotenv import load_dotenv
import os

load_dotenv()

engine = create_engine(
    f"postgresql+psycopg2://"
    f"{os.getenv('DB_USER')}:"
    f"{os.getenv('DB_PASSWORD')}@"
    f"{os.getenv('DB_HOST')}:"
    f"{os.getenv('DB_PORT')}/"
    f"{os.getenv('DB_NAME')}"
)

df = pd.read_parquet(
    "data/parquet/event_date=2026-06-13/posts.parquet"
)

df.to_sql(
    "posts",
    engine,
    schema="raw",
    if_exists="append",
    index=False
)

print("Data Loaded")