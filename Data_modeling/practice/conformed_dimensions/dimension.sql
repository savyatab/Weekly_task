--Conformed dimensions(Rule):
-->is a shared dimensions that is used consistently across multiple fact tables

CREATE TABLE dim_user(
    user_id INT PRIMARY KEY,
    user_name VARCHAR(100),
    city VARCHAR(100)
);
INSERT INTO dim_user VALUES
(1, 'Aarav', 'Kathmandu'),
(2, 'Sita', 'Pokhara');