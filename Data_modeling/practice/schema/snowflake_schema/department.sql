CREATE TABLE department(
    department_id SERIAL PRIMARY KEY,
    department_name TEXT
);
INSERT INTO department (department_name)
VALUES ('Science'), ('Math');
