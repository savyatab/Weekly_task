--fact tables
--Grain: One row represents one product sold to one customer on one specific date.
CREATE TABLE fact_sales (
    sales_id SERIAL PRIMARY KEY,
    customer_id INT,
    product_id INT,
    date_id INT,
    quantity INT,
    price DECIMAL,
    total_amount DECIMAL
);
--dimension table
--Grain : One row represents one unique customer.
CREATE TABLE dim_customer (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(100),
    city VARCHAR(100)
);
--Grain : Grain: One row represents one unique product.

CREATE TABLE dim_product (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    category VARCHAR(100)
);
--Grain: One row represents one calendar date.
CREATE TABLE dim_date (
    date_id INT PRIMARY KEY,
    full_date DATE,
    year INT,
    month INT,
    day INT
);
