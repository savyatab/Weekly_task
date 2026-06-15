CREATE TABLE fact_orders(
    order_id INT,
    user_id INT,
    amount INT
);
INSERT INTO fact_orders VALUES
(101, 1, 1200),
(102, 2, 800);

CREATE TABLE fact_shipments (
    shipment_id INT,
    user_id INT,
    delivery_days INT
);
INSERT INTO fact_shipments VALUES
(201, 1, 3),
(202, 2, 5);
