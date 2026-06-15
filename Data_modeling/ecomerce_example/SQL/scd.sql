--type 1 -->overwrite
UPDATE dim_customer
SET city = 'Bhaktapur'
WHERE customer_id = 1;

--type 2--> history tracking
CREATE TABLE dim_customer_scd2 (
    customer_id INT,
    customer_name VARCHAR(100),
    city VARCHAR(100),
    valid_from DATE,
    valid_to DATE,
    is_current BOOLEAN
);

INSERT INTO dim_customer_scd2 VALUES
(1, 'Ram', 'Kathmandu', '2025-01-01', '2025-12-31', FALSE),
(1, 'Ram', 'Bhaktapur', '2026-01-01', NULL, TRUE);