# BAD QUERY
# SELECT * FROM raw_events;

# GOOD QUERY
import duckdb

con = duckdb.connect("Data/warehouse/analytics.db")
df = con.execute("""
SELECT city, COUNT(*)
FROM raw_users
WHERE signup_date='2026-06-01'
GROUP BY city
""").fetchdf()

print(df)