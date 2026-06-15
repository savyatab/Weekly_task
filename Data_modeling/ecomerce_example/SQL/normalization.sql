--unnormalized data
CREATE TABLE raw_orders (
    order_id INT,
    customer_name VARCHAR(100),
    customer_city VARCHAR(100),
    product_name VARCHAR(100),
    product_price DECIMAL,
    order_date DATE,
    quantity INT
);

--removing partial dependencies
CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(100),
    customer_city VARCHAR(100)
);

CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    product_price DECIMAL
);

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE
);

CREATE TABLE order_items (
    order_item_id INT PRIMARY KEY,
    order_id INT,
    product_id INT,
    quantity INT
);

INSERT INTO customers VALUES
(1, 'Ram', 'Kathmandu'),
(2, 'Sita', 'Lalitpur');

INSERT INTO products VALUES
(101, 'Laptop', 80000),
(102, 'Mouse', 500);

INSERT INTO orders VALUES
(1001, 1, '2026-06-01'),
(1002, 2, '2026-06-02');

INSERT INTO order_items VALUES
(1, 1001, 101, 1),
(2, 1002, 102, 2);