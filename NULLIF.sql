--NULLIF
/* Making a new database and table to practice
using the NULLIF function. */

CREATE TABLE depts(
first_name VARCHAR(50),
department VARCHAR(50)
);

INSERT INTO depts(
first_name,
department
)
VALUES
('Vinton', 'A'),
('Lauren', 'A'),
('Claire', 'B');

-- Confirming code was correct.
SELECT * FROM depts;
-- Code was correct, moving on.

/* Want to find the ratio between
department members. */

SELECT (
SUM(CASE WHEN department = 'A' THEN 1 ELSE 0 END)/
SUM(CASE WHEN department = 'B' THEN 1 ELSE 0 END)
) AS department_ratio
FROM depts;

/* Deleting department B to test the NULLIF
function. */

DELETE FROM depts
WHERE department = 'B';

SELECT (
SUM(CASE WHEN department = 'A' THEN 1 ELSE 0 END)/
SUM(CASE WHEN department = 'B' THEN 1 ELSE 0 END)
) AS department_ratio
FROM depts;
/* Ran the same code again and it returned ERROR. */

SELECT (
SUM(CASE WHEN department = 'A' THEN 1 ELSE 0 END)/
NULLIF(SUM(CASE WHEN department = 'B' THEN 1 ELSE 0 END), 0))
AS department_ratio
FROM depts;
/* Ran code and it returned [null] instead of ERROR. */