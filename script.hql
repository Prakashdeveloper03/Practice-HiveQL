--Create a new table
CREATE TABLE table1 (
    id INT,
    name STRING,
    age INT,
    weight FLOAT,
    is_student BOOLEAN,
    birth_date DATE,
    address STRUCT<street:STRING, city:STRING, state:STRING>,
    hobbies ARRAY<STRING>,
    phone_numbers MAP<STRING, STRING>
);

--Insert data into the table
INSERT INTO table1
VALUES
(1, 'Alice', 25, 62.5, true, '1998-04-15', named_struct('street', '123 Main St', 'city', 'Los Angeles', 'state', 'CA'), array('reading', 'running'), map('home', '555-1234', 'work', '555-5678')),
(2, 'Bob', 30, 80.0, false, '1993-08-20', named_struct('street', '456 Elm St', 'city', 'San Francisco', 'state', 'CA'), array('swimming', 'dancing'), map('home', '555-4321', 'cell', '555-8765')),
(3, 'Charlie', 40, 75.5, true, '1983-11-10', named_struct('street', '789 Oak St', 'city', 'New York', 'state', 'NY'), array('hiking', 'painting'), map('work', '555-9876'));

--Select one column
SELECT name FROM table1;

--Select multiple columns
SELECT name, age, address.city FROM table1;

--Select all columns
SELECT * FROM table1;

--Select distinct values
SELECT DISTINCT is_student FROM table1;

--Sort ascending and descending
SELECT name, age FROM table1 ORDER BY age ASC;
SELECT name, age FROM table1 ORDER BY age DESC;

--Filtering data with comparison operators
SELECT * FROM table1 WHERE age > 30;
SELECT * FROM table1 WHERE age > 30;
SELECT * FROM table1 WHERE age != 30;
SELECT * FROM table1 WHERE age = 30;
SELECT * FROM table1 WHERE weight <= 75.5;
SELECT * FROM table1 WHERE weight >= 75.5;

--Filtering data with logical operators
SELECT * FROM table1 WHERE age > 30 AND is_student = true;
SELECT * FROM table1 WHERE age < 30 OR is_student = true;
SELECT * FROM table1 WHERE NOT (age < 30 OR is_student = true);

--Filtering data with IN operator
SELECT * FROM table1 WHERE id IN (1, 3);

--Filtering data with NOT IN operator
SELECT * FROM table1 WHERE id NOT IN (1, 3);

--Filtering data with BETWEEN operator
SELECT * FROM table1 WHERE age BETWEEN 25 AND 35;

--Filtering data with NOT BETWEEN operator
SELECT * FROM table1 WHERE age NOT BETWEEN 25 AND 35;

--Filtering data with LIKE operator
SELECT * FROM table1 WHERE name LIKE 'A%';

--Filtering data with NOT LIKE operator
SELECT * FROM table1 WHERE name NOT LIKE 'A%';

--Filtering data with IS NULL operator
SELECT * FROM table1 WHERE phone_numbers['cell'] IS NULL;

--Filtering data with IS NOT NULL operator
SELECT * FROM table1 WHERE phone_numbers['cell'] IS NOT NULL;

--Inner join
SELECT * FROM table1 INNER JOIN table2 ON table1.id = table2.id;

--Left join
SELECT * FROM table1 LEFT JOIN table2 ON table1.id = table2.id;

--Right join
SELECT * FROM table1 RIGHT JOIN table2 ON table1.id = table2.id;

--Full outer join
SELECT * FROM table1 FULL OUTER JOIN table2

--Group by age and count the number of people in each age group
SELECT age, COUNT(*) FROM table1 GROUP BY age;

--Group by is_student and calculate the average weight for each group
SELECT is_student, AVG(weight) FROM table1 GROUP BY is_student;

--Union all rows from table1 and table2
SELECT * FROM table1 UNION ALL SELECT * FROM table2;

--Intersect rows from table1 and table2
SELECT * FROM table1 INTERSECT SELECT * FROM table2;

--Subquery
SELECT name FROM table1 WHERE id IN (SELECT id FROM table1 WHERE phone_numbers IS NOT NULL);

--Update the name of the person with id 1
UPDATE table1 SET name = 'Alicia' WHERE id = 1;

--Delete the person with id 3
DELETE FROM table1 WHERE id = 3;

--Add a new column to the table
ALTER TABLE table1 ADD COLUMN email STRING;

--Calculate the maximum age
SELECT MAX(age) FROM table1;

--Calculate the minimum weight
SELECT MIN(weight) FROM table1;

--Calculate the square root of the weight
SELECT SQRT(weight) FROM table1;

--Calculate the absolute value of the age
SELECT ABS(age) FROM table1;

--Convert the name to uppercase
SELECT UPPER(name) FROM table1;

--Concatenate the name and address.city columns
SELECT CONCAT(name, ', ', address.city) FROM table1;

--Extract the year from the birth_date column
SELECT YEAR(birth_date) FROM table1;

--Add 30 days to the birth_date column
SELECT DATE_ADD(birth_date, 30) FROM table1;

--Calculate the average weight for each age group using a window function
SELECT age, AVG(weight) OVER (PARTITION BY age) FROM table1;

--Create an index on the name column
CREATE INDEX name_index ON table1 (name);

--Create a view that selects the name and age columns
CREATE VIEW name_age_view AS SELECT name, age FROM table1;

--Create a trigger that updates the email column whenever the phone_numbers map is updated
CREATE TRIGGER update_email AFTER UPDATE ON table1
FOR EACH ROW
WHEN (NEW.phone_numbers != OLD.phone_numbers)
BEGIN
UPDATE table1 SET email = 'updated_email' WHERE id = NEW.id;
END;