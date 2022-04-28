--Theory: 
-----Views
CREATE VIEW TABLE_VIEW AS
SELECT column1, column2, column3
FROM  TABLE; 

DROP VIEW view_name; 

CREATE VIEW COMPANY_VIEW AS
SELECT ID, NAME, AGE
FROM  COMPANY;

DROP VIEW COMPANY_VIEW

-----ORDER BY, ascending and/or descending order:
--(sort the data by one or more columns in the ascending and/or descending order)
SELECT column-list
FROM table_name
[WHERE condition]
[ORDER BY column1, column2, .. columnN] [ASC | DESC];

SELECT * FROM COMPANY ORDER BY AGE ASC;

SELECT * FROM COMPANY ORDER BY NAME, SALARY ASC;

SELECT * FROM COMPANY ORDER BY NAME DESC;

-----SELECT DISTINCT - eliminate all the duplicate records and fetching only unique records
SELECT DISTINCT column1, column2,.....columnN
FROM table_name
WHERE [condition]

SELECT DISTINCT name FROM COMPANY;


-----LIMIT
SELECT column1, column2, columnN
FROM table_name
LIMIT [no of rows]

SELECT * FROM COMPANY LIMIT 4;

SELECT * FROM COMPANY LIMIT 3 OFFSET 2; -- offset - starts from 3th record

--Filtering Data:
--Comparision operators/WHERE clause:
--=	Equal
--<> Not equal to
-->	Greater than
-->= Greater than or equal to
--<	Less than
--<= Less than or equal to

SELECT column1, column2, columnN 
FROM table_name
WHERE [condition]


---Equal to operator(=)
SELECT 
    employee_id, first_name, last_name
FROM
    employees
WHERE
    last_name = 'Himuro';
	
	
---NULL	
SELECT 
    employee_id, first_name, last_name, phone_number
FROM
    employees
WHERE
    phone_number IS NULL;
	
	
---Not equal to operator (<>)
SELECT 
    employee_id, first_name, last_name, department_id
FROM
    employees
WHERE
    department_id <> 8
ORDER BY first_name , last_name;
	
	
--AND
SELECT 
    employee_id, first_name, last_name, department_id
FROM
    employees
WHERE
    department_id <> 8
        AND department_id <> 10
ORDER BY first_name , last_name; 


-----Greater than operator (>)
SELECT 
    employee_id, first_name, last_name, salary
FROM
    employees
WHERE
    salary > 10000
ORDER BY salary DESC;


SELECT 
    employee_id, first_name, last_name, salary
FROM
    employees
WHERE
    salary > 10000 AND department_id = 8
ORDER BY salary DESC;


--Less than operator (<)
SELECT 
    employee_id, first_name, last_name, salary
FROM
    employees
WHERE
    salary < 10000
ORDER BY salary DESC;


--Greater than or equal operator (>=) / Less than or equal to operator(<=)
SELECT 
    employee_id, first_name, last_name, salary
FROM
    employees
WHERE
    salary >= 9000
ORDER BY salary;


-- Logical operators:
--ALL	Return true if all comparisons are true
--AND	Return true if both expressions are true
--ANY	Return true if any one of the comparisons is true.
--BETWEEN	Return true if the operand is within a range
--EXISTS	Return true if a subquery contains any rows
--IN	Return true if the operand is equal to one of the value in a list
--LIKE	Return true if the operand matches a pattern
--NOT	Reverse the result of any other Boolean operator.
--OR	Return true if either expression is true
--SOME	Return true if some of the expressions are true
--IS NULL/IS NOT NULL - returnss boolean

--AND
SELECT 
    first_name, last_name, salary
FROM
    employees
WHERE
    salary > 5000 AND salary < 7000
ORDER BY salary;

--OR
SELECT 
    first_name, last_name, salary
FROM
    employees
WHERE
    salary = 7000 OR salary = 8000
ORDER BY salary;

--IS NULL
SELECT 
    first_name, last_name, phone_number
FROM
    employees
WHERE
    phone_number IS NULL
ORDER BY first_name, last_name;

--BETWEEN
SELECT 
    first_name, last_name, salary
FROM
    employees
WHERE
    salary BETWEEN 9000 AND 12000
ORDER BY salary;

--IN
SELECT 
    first_name, last_name, department_id
FROM
    employees
WHERE
    department_id IN (8, 9)
ORDER BY department_id;



--Wildcards operators:
--The percent sign ( %) represents zero, one, or multiple characters.
--The underscore sign ( _) represents a single character.
--LIKE:
--finds all employees whose first name starts with the string jo:
SELECT 
    employee_id, first_name, last_name
FROM
    employees
WHERE
    first_name LIKE 'jo%'
ORDER BY first_name;


SELECT *
FROM
   Book
WHERE
  name NOT LIKE 'Post%';


--first names whose the second character is  h:
SELECT 
    employee_id, first_name, last_name
FROM
    employees
WHERE
    first_name LIKE '_h%'
ORDER BY first_name;

--CAST:
WHERE SALARY::text LIKE '200%'
--Finds any values that start with 200

	WHERE SALARY::text LIKE '%200%'
--Finds any values that have 200 in any position

WHERE SALARY::text LIKE '_00%'
--Finds any values that have 00 in the second and third positions

WHERE SALARY::text LIKE '2_%_%'
--Finds any values that start with 2 and are at least 3 characters in length

WHERE SALARY::text LIKE '%2'
--Finds any values that end with 2

WHERE SALARY::text LIKE '_2%3'
--Finds any values that have 2 in the second position and end with a 3

WHERE SALARY::text LIKE '2___3'
--Finds any values in a five-digit number that start with 2 and end with 3

--finds all employees whose salaries are 
--greater than all salaries of employees in the department 8:
SELECT 
    first_name, last_name, salary
FROM
    employees
WHERE
    salary >= ALL (SELECT 
            salary
        FROM
            employees
        WHERE
            department_id = 8)
ORDER BY salary DESC;


--ANY
SELECT 
    first_name, last_name, salary
FROM
    employees
WHERE
    salary > ANY(SELECT 
            AVG(salary)
        FROM
            employees
        GROUP BY department_id)
ORDER BY first_name , last_name;


--EXISTS
SELECT 
    first_name, last_name
FROM
    employees e
WHERE
    EXISTS( SELECT 
            1
        FROM
            dependents d
        WHERE
            d.employee_id = e.employee_id);



--HAVING:
--The WHERE clause places conditions on the selected columns, 
--whereas the HAVING clause places conditions on groups created by the GROUP BY clause:

SELECT
FROM
WHERE
GROUP BY
HAVING
ORDER BY
LIMIT

SELECT column1, column2
FROM table1, table2
WHERE [ conditions ]
GROUP BY column1, column2
HAVING [ conditions ]
ORDER BY column1, column2
LIMIT 10

SELECT NAME 
FROM COMPANY 
GROUP BY name 
HAVING count(name) < 2;

--RANDOM
SELECT
	*
FROM
	table_name
ORDER BY
	RANDOM()
LIMIT 1;