CREATE TABLE course(
    course_id SERIAL PRIMARY KEY,
    course_name TEXT,
    credits INT,
    department_id INT REFERENCES department(department_id)
);

INSERT INTO course(course_name, credits, department_id)
VALUES 
('Math', 4, 2),
('Science', 3, 1);

