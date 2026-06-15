CREATE TABLE dim_student(
    student_id INT PRIMARY KEY,
    student_name TEXT,
    gender TEXT
);
CREATE TABLE dim_course(
    course_id INT primary key,
    course_name TEXT,
    credits INT
);

CREATE TABLE dim_date(
    date_id INT primary key,
    full_date DATE,
    year INT,
    month INT
);

INSERT INTO dim_student VALUES
(1,'Ram', 'M'),
(2, 'Sita', 'F');

INSERT INTO dim_course VALUES
(101, 'Math', 4),
(102, 'Science', 3);

INSERT INTO dim_date VALUES
(1, '2026-01-01', 2026, 1);