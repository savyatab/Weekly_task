--enity event hybrid models 
--entity -->DIMENSIONS-->STABLE DATA
--event--> FACTS(ACTIVITIES)
CREATE table dim_users(
    user_id INT PRIMARY KEY,
    user_name VARCHAR(100),
    CITY VARCHAR(100)
);
INSERT INTO dim_users VALUES
(1, 'Aarav', 'Kathmandu'),
(2, 'Sita', 'Pokhara');

--event tables (fact)
CREATE TABLE fact_order (
    order_id INT,
    user_id INT,
    item_name VARCHAR(100),
    amount INT,
    order_date DATE
);
INSERT INTO fact_order VALUES
(101, 1, 'Laptop', 1200, '2026-06-01'),
(102, 2, 'Phone', 800, '2026-06-02');

--join query 
SELECT o.order_id, u.user_name, u.city, o.item_name, o.amount
FROM fact_order o
JOIN dim_users u
ON o.user_id = u.user_id;