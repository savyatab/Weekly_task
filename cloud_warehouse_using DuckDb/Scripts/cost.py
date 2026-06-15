#DuckDB = SQL engine inside Python for analytics
import duckdb
con = duckdb.connect("Data/warehouse/analytics.db")

result = con.execute("""
SELECT 
    city,
    COUNT(*) AS total_users
FROM raw_users
WHERE signup_date = '2026-06-01'
GROUP BY city
""").fetchdf()

print(result)