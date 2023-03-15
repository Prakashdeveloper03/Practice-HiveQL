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