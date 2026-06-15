--WAREHOUSE SPECIFIC PATTERNS --> MERGE(USED TO COMBINE INSERT,UPDATE,DELETE IN A SINGLE STATEMENT BASED 
--ON MATCHING CONDITION BETWEEN TWO TABLES)


CREATE TABLE IF NOT EXISTS employee_updates (
    emp_id INT,
    emp_name VARCHAR(100),
    dept_id INT,
    salary NUMERIC(10,2),
    hire_date DATE
);
INSERT INTO employee_updates VALUES
(1, 'Sam', 1, 55000, '2024-01-02'),
(5, 'Anita', 2, 48000, '2025-02-01')
ON CONFLICT DO NOTHING;

MERGE INTO employees e
USING (
    SELECT DISTINCT ON (emp_id)  --using distinct to remove duplicates values from result set
        emp_id,
        emp_name,
        dept_id,
        salary,
        hire_date
    FROM employee_updates
    ORDER BY emp_id
) u
ON e.emp_id = u.emp_id

WHEN MATCHED THEN
    UPDATE SET
        emp_name = u.emp_name,
        dept_id = u.dept_id,
        salary = u.salary,
        hire_date = u.hire_date

WHEN NOT MATCHED THEN
    INSERT (emp_id, emp_name, dept_id, salary, hire_date)
    VALUES (u.emp_id, u.emp_name, u.dept_id, u.salary, u.hire_date);

--upsert -->if row eexist update else insert
-- CREATE TABLE products(
--     product_id INT PRIMARY KEY,
--     product_name VARCHAR(100),
--     price NUMERIC
-- );

-- INSERT INTO products
-- VALUES(1,'laptop',50000);

-- INSERT INTO products
-- VALUES (1,'Laptop',60000)
-- ON CONFLICT(product_id)
-- DO UPDATE
-- SET price = EXCLUDED.price;
-- SELECT * FROM products;