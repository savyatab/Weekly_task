--normalized
CREATE TABLE students(
    student_id SERIAL PRIMARY KEY,
    student_name TEXT,
    gender_id INT REFERENCES gender(gender_id)
);

INSERT INTO students(student_name, gender_id)
VALUES 
('Ram', 1),
('Sita', 2);