--Partial Dependency (doesnot follow 2nf)
-- CREATE TABLE enrollment (
--     student_id INT,
--     student_name VARCHAR(100),
--     course_id INT,
--     course_name VARCHAR(100)
-- );
-- INSERT into enrollment VALUES
-- (1,'sita',101,'science');

-- repetition of student_name
-- repetition of course_name
-- update anomalies
 -- remove partial dependency(every non prime attribute ,non key attribute must depend on primary key)
 --(now creating separate table for student and courses and enrollment )
 --student_id andcourse_id are peimary key
 
 CREATE TABLE student (
    student_id INT PRIMARY KEY,
    student_name VARCHAR(100)
);

CREATE TABLE courses(
    course_id INT PRIMARY KEY,
    course_name VARCHAR(100)
);

CREATE TABLE enrollments(
    student_id INT,
    course_id INT
);
INSERT into student VALUES
(1,'Sumi');
INSERT into courses VALUES
 (101,'science');


--analytics query
SELECT 
    s.student_id,
    s.student_name,
    c.course_id,
    c.course_name
FROM enrollments e
JOIN student s ON e.student_id = s.student_id
JOIN courses c ON e.course_id = c.course_id;