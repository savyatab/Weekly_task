import duckdb

con = duckdb.connect("Data/warehouse/analytics.db")

con.execute("""
CREATE TABLE IF NOT EXISTS metadata (
    table_name TEXT,
    load_date TEXT,
    row_count INT
)
""")

con.execute("""
INSERT INTO metadata VALUES (
    'raw_users',
    '2026-06-11',
    (SELECT COUNT(*) FROM raw_users)
)
""")

print("Metadata updated")