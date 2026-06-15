CREATE TABLE dim_customer (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(100),
    city VARCHAR(100)
);

CREATE TABLE dim_product (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    category VARCHAR(100)
);

CREATE TABLE dim_date (
    date_id INT PRIMARY KEY,
    full_date DATE
);

CREATE TABLE fact_sales (
    sales_id SERIAL PRIMARY KEY,
    customer_id INT REFERENCES dim_customer(customer_id),
    product_id INT REFERENCES dim_product(product_id),
    date_id INT REFERENCES dim_date(date_id),
    quantity INT,
    total_amount DECIMAL
);

INSERT INTO dim_customer VALUES
(1, 'Ram', 'Kathmandu'),
(2, 'Sita', 'Lalitpur');

INSERT INTO dim_product VALUES
(101, 'Laptop', 'Electronics'),
(102, 'Mouse', 'Accessories');

INSERT INTO dim_date VALUES
(1, '2026-06-01'),
(2, '2026-06-02');

INSERT INTO fact_sales VALUES
(1, 1, 101, 1, 1, 80000),
(2, 2, 102, 2, 2, 1000);