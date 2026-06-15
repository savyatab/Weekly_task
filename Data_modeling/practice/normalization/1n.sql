--created database name analytics_practice
-- bad table --> Doesnot follow rules of 1n (doesnot have individual values)
CREATE TABLE no_1nf (
    student_id INT,
    student_name VARCHAR(100),
    course_id INT,
    course VARCHAR(100)
);

INSERT INTO no_1nf VALUES (1, 'Ram',101, 'Math,Science'); --  insert multiple values 
INSERT INTO no_1nf VALUES (2, 'Ramu',103, 'English');
INSERT INTO no_1nf VALUES (3, 'Sita',101,'Math');
 

--1N normalization
--ALL COLUMNS CONTAINS ATOMIC VALUES(INDIVIDUAL),ALL ROW IS UNIQUE AND ALL COLUMNS HAS SINGLE NAME)
CREATE table table_1N(
    student_id INT,
    student_name VARCHAR(100),
    course_id INT,
    course VARCHAR(100)
);
INSERT INTO table_1n VALUES
(1, 'Ram', 101, 'Math'),
(1, 'Ram', 102, 'Science'),
(2, 'Sita', 102, 'Science');

