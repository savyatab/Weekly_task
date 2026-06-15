--wide event model
CREATE TABLE wide_sales_event (
    event_id INT,
    customer_id INT,
    product_id INT,
    event_type VARCHAR(50),
    event_timestamp TIMESTAMP
);

--Hybrid model
CREATE TABLE entity_event (
    event_id INT,
    entity_type VARCHAR(50),
    entity_id INT,
    event_action VARCHAR(50),
    timestamp TIMESTAMP
);