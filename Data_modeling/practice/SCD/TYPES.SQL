CREATE TABLE customer_source(
customer_id INT PRIMARY KEY,
customer_name VARCHAR(100),
city VARCHAR(100)
);

INSERT into customer_source
VALUES
(101,'Hari','Kathmandu'),
(102,'Ram','Butwal');

--Type 0 (fixed dimensions)-->Never chanige the data (birthdate,historical data,nationality)
CREATE TABLE dim_customer_type0(
    customer_id INT PRIMARY key,
    customer_name VARCHAR(100),
    city VARCHAR(100)
    );

INSERT INTO dim_customer_type0
SELECT * FROM customer_source;

--New source data 
UPDATE customer_source
SET city = 'pkr'
where customer_id =101;  

--changes the customer_source but dim_customer_type0 remains same no any update

--Type 1 -->override(old value replaced with new value)(no hiatory maintained)
CREATE TABLE dim_customer_type1(
    customer_id INT PRIMARY key,
    customer_name VARCHAR(100),
    city VARCHAR(100)
    );

INSERT INTO dim_customer_type1
SELECT * FROM customer_source;

UPDATE dim_customer_type1
SET city='Biratnagar'
WHERE customer_id=101;

--type 2 --> CREATES NEW ROW FOR EVERY CHANGE AND MAINTAINS HISTORY ALSO.
CREATE TABLE dim_customer_type2 (
    customer_sk SERIAL PRIMARY KEY,
    customer_id INT,
    customer_name VARCHAR(100),
    city VARCHAR(50),
    start_date DATE,
    end_date DATE,
    current_flag CHAR(1)
);
INSERT INTO dim_customer_type2 
(customer_id, customer_name, city, start_date, end_date, current_flag)
VALUES
(101, 'Ram', 'Kathmandu', CURRENT_DATE, NULL, 'Y');


--type 3--Limited history(stores previous value in additional columns)
CREATE TABLE dim_customer_type3 (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(100),
    current_city VARCHAR(50),
    previous_city VARCHAR(50)
);

INSERT INTO dim_customer_type3 (customer_id, customer_name, current_city, previous_city)
VALUES
(101, 'Ram', 'Kathmandu', NULL),
(102, 'Hari', 'Pokhara', NULL);

UPDATE dim_customer_type3
SET previous_city = current_city,
    current_city = 'Biratnagar'
WHERE customer_id = 101;

--Type 4-->current data stays in one table and historical data stays in seperate table
CREATE TABLE dim_customer_current (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(100),
    city VARCHAR(50)
);

CREATE TABLE dim_customer_history (
    
    history_id SERIAL PRIMARY KEY,
    customer_id INT,
    customer_name VARCHAR(100),
    city VARCHAR(50),
    change_date timestamp
);

INSERT INTO dim_customer_current
VALUES
(101,'Ram','Kathmandu');

INSERT INTO dim_customer_history
(
    customer_id, customer_name,city,change_date
)
SELECT customer_id,customer_name,city,CURRENT_TIMESTAMP
FROM dim_customer_current
WHERE customer_id=101;

UPDATE dim_customer_current
SET city='Biratnagar'
WHERE customer_id=101;