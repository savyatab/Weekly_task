CREATE TABLE departments(
    dept_id SERIAL PRIMARY KEY,
    dept_name VARCHAR(100)
);

CREATE TABLE employees(
    emp_id SERIAL PRIMARY KEY,
    emp_name VARCHAR(100),
    dept_id INT REFERENCES departments(dept_id),
    salary NUMERIC (10,2),
    hire_date DATE
);

CREATE TABLE sales(
    sale_id SERIAL PRIMARY KEY,
    emp_id INT REFERENCES employees(emp_id),
    sale_amount NUMERIC(10,2),
    sale_date DATE
);

INSERT INTO departments(dept_name)
VALUES
('IT'),
('HR'),
('Finance');

INSERT INTO employees(emp_name,dept_id,salary,hire_date)
VALUES
('Sam',1,50000,'2024-01-02'),
('Ram',1,70000,'2023-04-12'),
('Sanjana',2,45000,'2022-05-02'),
('Rita',3,60000,'2023-06-19');

INSERT INTO sales(emp_id,sale_amount,sale_date)
VALUES
(1,1000,'2025-01-01'),
(1,1500,'2025-01-05'),
(2,2000,'2025-01-03'),
(3,500,'2025-01-07'),
(2,2500,'2025-01-10');


