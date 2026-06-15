--SCD Type 2 = “Time machine for data”
CREATE TABLE dim_customer_SCD2(
    customer_sk SERIAL PRIMARY KEY,
    customer_id INT,
    city VARCHAR(50),
    valid_from DATE,
    valid_to DATE,
    is_current CHAR(1)
);

INSERT INTO dim_customer_SCD2 VALUES
(1, 101, 'Kathmandu', '2024-01-01', NULL, 'Y');

--CLOSE OLD RECORDS
UPDATE dim_customer_SCD2
set valid_to =  '2025-01-01',
    is_current = 'N'
WHERE customer_id = 101
AND is_current = 'Y';


--INSERT NEW RECORD

INSERT INTO dim_customer_SCD2
VALUES
(2, 101, 'Pokhara', '2025-01-01', NULL, 'Y');

-- IF city changes:
--     Update old row → set end date + is_current = N
--     Insert new row → new city + start date + is_current = Y