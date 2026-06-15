ALTER TABLE fact_enrollment
ADD COLUMN fee_paid INT;

ALTER TABLE fact_enrollment
ADD COLUMN attendance_days INT;

--UPDATING MISSING VALUES
INSERT INTO fact_enrollment VALUES
(1, 101, 1, 'enrolled', 1000, 20),
(2, 102, 1, 'dropped',  800,  10);

--ADDITIVE MEASURES-> can be summed across all dimensions
SELECT SUM(fee_paid) AS total_fee
FROM fact_enrollment;

--fee by course
SELECT c.course_name ,SUM(F.fee_paid) AS total_fee
FROM fact_enrollment f 
JOIN dim_course c ON f.course_id = c.course_id
GROUP BY c.course_name;


--Semi Additive measures-> can be summed among some dimension but not time
ALTER TABLE fact_enrollment
ADD COLUMN balance_fee INT ;
INSERT INTO fact_enrollment VALUES
(1, 101, 1, 'enrolled', 1000, 20, 500),
(2, 102, 1, 'dropped',  800, 10, 300);

-- BALANCE (STUDENT)
SELECT s.student_name , SUM(f.balance_fee)
FROM fact_enrollment f 
JOIN dim_student s ON s.student_id = f.student_id
GROUP BY s.student_name; 

--Non -additive measures-->cannot be summed at all cannot be meaningfully added (summed) across any dimension like time, students, or courses.
ALTER TABLE fact_enrollment
ADD COLUMN attendance_rate FLOAT;

INSERT INTO fact_enrollment VALUES
(1, 101, 1, 'enrolled', 1000, 20, 500, 0.67),
(2, 102, 1, 'dropped',  800, 10, 300, 0.33);

--AVERAGE ATTENDANCE BY COURSE
SELECT c.course_name, AVG(f.attendance_rate)
FROM fact_enrollment f
JOIN dim_course c ON c.course_id = f.course_id
GROUP BY c.course_name;