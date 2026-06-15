-- STAR SCHEMA (denormalized)
-- Fact connects directly to dimensions
SELECT * 
FROM fact_sales f
JOIN dim_customer c ON f.customer_id = c.customer_id
JOIN dim_product p ON f.product_id = p.product_id;


--SNOWFLAKE (normalized dimensions)
CREATE TABLE dim_city (
    city_id INT PRIMARY KEY,
    city_name VARCHAR(100)
);

CREATE TABLE dim_customer_sf (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(100),
    city_id INT
);