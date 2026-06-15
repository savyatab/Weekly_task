CREATE TABLE fact_enrollments (
   enrollment_id SERIAL PRIMARY KEY,
   student_id INT REFERENCES dim_student(student_id),
   course_id INT REFERENCES course(course_id),
   date_id INT REFERENCES dim_date(date_id),
   status TEXT
);

INSERT INTO fact_enrollments (student_id, course_id, date_id, status)
VALUES
(1, 1, 1, 'enrolled'),
(2, 2, 1, 'dropped');


SELECT
    s.student_name,
    c.course_name,
    d.full_date,
    f.status
FROM fact_enrollments f

JOIN dim_student s ON f.student_id = s.student_id
JOIN course c ON f.course_id = c.course_id
JOIN dim_date d ON f.date_id = d.date_id;


