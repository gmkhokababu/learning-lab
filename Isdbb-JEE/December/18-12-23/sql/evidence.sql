DROP TABLE student;
-- create table
CREATE TABLE student(
	id NUMBER(6) PRIMARY KEY,
	name VARCHAR2(25) NOT NULL,
	hire_date DATE NOT NULL,
	salary NUMBER(8,2) NOT NULL
);

-- Create column
ALTER TABLE student
ADD department_id NUMBER(3) NOT NULL;
-- Insert Data

INSERT INTO student (id, name , hire_date, salary, department_id)
VALUES (101, 'Aziz', '01-JAN-2022', 12000, 11);

INSERT INTO student (id, name , hire_date, salary, department_id)
VALUES (102, 'Shajib', '01-FEB-2021', 15000, 11);

INSERT INTO student (id, name , hire_date, salary, department_id)
VALUES (103, 'Ema', '12-AUG-2021', 12500, 13);

INSERT INTO student (id, name , hire_date, salary, department_id)
VALUES (104, 'Sumon', '15-AUG-2020', 18500, 13);

INSERT INTO student (id, name , hire_date, salary, department_id)
VALUES (105, 'ARIF', '19-JUL-2020', 16500, 13);

INSERT INTO student (id, name , hire_date, salary, department_id)
VALUES (106, 'Abu', '24-DEC-2020', 18500, 15);

--Update
UPDATE student
SET name = 'Shamim', salary = '25000'
WHERE id = 106;

-- DELETE
DELETE FROM student
WHERE id = 104;

-- subquery
Select * FROM student 
WHERE department_id = 13;

DELETE FROM student
where id=105;

alter table student
drop (salary);

alter table student
modify (email VARCHAR2(40));

drop view xyz;

create view xyz
as
select name,email
from student;

drop synonym asd;

create synonym asd
for student;

commit;

-- AVARAGE salary
SELECT AVG(salary), department_id
FROM student
WHERE salary > 10000
GROUP BY department_id;
