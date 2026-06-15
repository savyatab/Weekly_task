-- Fact tables/ Measures table
--fact stores numbers and events

CREATE TABLE fact_enrollment (
    student_id INT REFERENCES dim_student(student_id),
    course_id INT REFERENCES dim_course(course_id),
    date_id INT REFERENCES dim_date(date_id),
    status TEXT
);
--Inserting
INSERT INTO fact_enrollment VALUES
(1, 101, 1, 'enrolled'),
(2, 102, 1, 'dropped');

-- Analytics query
SELECT 
     s.student_name,
     c.course_name,
     d.full_date,
     f.status
FROM fact_enrollment f 
JOIN dim_student s ON f.student_id = s.student_id
JOIN dim_course c ON f.course_id= c.course_id
JOIN dim_date d ON f.date_id = d.date_id ;