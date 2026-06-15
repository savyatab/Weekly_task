-->Stores everything in one big denormalized table,including entity details and event details
-- no koins required evrything stored in tables
--Problem: Duplicate user info ,Hard to update city/name
CREATE TABLE app_activity(
    event_id INT,
    user_id INT,
    user_name VARCHAR(100),
    item_name VARCHAR(100),
    city VARCHAR(50),
    event_type VARCHAR(50),
    amount INT,
    event_time DATE
) ;

INSERT INTO app_activity VALUES
(1, 1, 'Aarav', 'Laptop', 'Kathmandu', 'purchase', 1200, '2026-06-01'),
(2, 2, 'Sita', 'Phone', 'Pokhara', 'purchase', 800, '2026-06-02');

SELECT user_name,item_name,amount FROM app_activity;