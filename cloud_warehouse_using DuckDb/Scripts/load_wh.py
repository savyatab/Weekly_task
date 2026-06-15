import duckdb

con = duckdb.connect("Data/warehouse/analytics.db")

con.execute("""
CREATE OR REPLACE TABLE raw_users AS
SELECT * 
FROM read_parquet('Data/parquet/signup_date=*/data.parquet')
""")
print("Loaded successfully into warehouse")