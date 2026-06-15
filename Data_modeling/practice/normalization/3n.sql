
CREATE TABLE no_3nf (
    student_id INT,
    student_name VARCHAR,
    dept_name VARCHAR,
    dept_head VARCHAR
);

INSERT INTO no_3nf (student_id, student_name, dept_name, dept_head)
VALUES 
(1, 'Sita', 'Finance', 'Mr. Sharma'),
(2, 'Ram', 'CS', 'Dr. Gupta'),
(3, 'Asha', 'Finance', 'Mr. Sharma'),
(4, 'Ravi', 'CS', 'Dr. Gupta');

--3n --> if it satisfies 2NF and there are no transitive dependencies
CREATE TABLE stud_3nf (
    student_id INT PRIMARY KEY,
    student_name TEXT,
    dept_name TEXT
);
INSERT INTO stud_3nf (student_id, student_name, dept_name)
VALUES 
(1, 'Sita', 'Finance'),
(2, 'Ram', 'CS'),
(3, 'Asha', 'Finance');

CREATE TABLE depart_3nf (
    dept_name TEXT PRIMARY KEY,
    dept_head TEXT
);
INSERT INTO depart_3nf (dept_name, dept_head)
VALUES 
('Finance', 'Mr. Sharma'),
('CS', 'Dr. Gupta');

--ANALYTICS QUERY ->SQL query that summarizes or analyzes data using JOINs, GROUP BY, COUNT, SUM, AVG, etc.
SELECT
    s.student_id,
    s.student_name,
    s.dept_name,
    d.dept_head
FROM stud_3nf s
JOIN depart_3nf d 
ON s.dept_name = d.dept_name;