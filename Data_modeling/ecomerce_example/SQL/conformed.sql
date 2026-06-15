-- CONFORMED DIMENSIONS

-- Sales Process uses shared dimensions
-- Customer, Product, Date

CREATE TABLE bus_matrix (
    process_name VARCHAR(100),
    customer_dim BOOLEAN,
    product_dim BOOLEAN,
    date_dim BOOLEAN
);

INSERT INTO bus_matrix VALUES
('Sales', TRUE, TRUE, TRUE),
('Inventory', TRUE, TRUE, TRUE);