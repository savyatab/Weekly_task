--Recursive CTE --> 
CREATE TABLE Organiztaion(
    emp_id INT,
    emp_name VARCHAR(100),
    manager_id INT
);

INSERT INTO Organiztaion
VALUES
(1,'CEO',NULL),
(2,'Manager A',1),
(3,'Manager B',1),
(4,'Employee X',2),
(5,'Employee Y',2);

WITH RECURSIVE org_tree AS (
    SELECT emp_id,
    emp_name,
    manager_id
    FROM Organiztaion
    WHERE manager_id IS NULL

    UNION 
-- rECURSIVE PART
    SELECT o.emp_id,
        o.emp_name,
        o.manager_id
    FROM Organiztaion o
    JOIN org_tree ot 
      ON o.manager_id = ot.emp_id

)
SELECT * FROM org_tree;
  


