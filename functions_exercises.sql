USE employees;


# Modify your first query to order by first name. The first result should be Irena Pelz and the last result should be Vidya Awdeh.
SELECT * FROM employees WHERE first_name IN ('Irena', 'Vidya', 'Maya') ORDER BY first_name;

# Update the query to order by first name and then last name. The first result should now be Irena Acton and the last should be Vidya Zweizig.

SELECT * FROM employees WHERE first_name IN ('Irena', 'Vidya', 'Maya') ORDER BY first_name, last_name;

# Change the ORDER BY clause so that you order by last name before first name. Your first result should still be Irena Acton but now the last result should be Maya Zyda.

SELECT * FROM employees WHERE first_name IN ('Irena', 'Vidya', 'Maya') ORDER BY last_name, first_name;

# Update your queries for employees with 'e' in their last name to sort the results by their employee number. Make sure the employee numbers are in the correct order.

SELECT * FROM employees WHERE last_name LIKE 'E%' ORDER BY emp_no;

# Now reverse the sort order for both queries and compare results.
SELECT * FROM employees WHERE last_name LIKE 'E%' ORDER BY emp_no DESC ;
SELECT * FROM employees WHERE first_name IN ('Irena', 'Vidya', 'Maya') ORDER BY first_name DESC;




SELECT * FROM employees WHERE last_name LIKE '%q%';


SELECT * FROM employees WHERE first_name = 'Irena' OR first_name = 'Vidya' OR first_name = 'Maya';

SELECT * FROM employees WHERE (first_name = 'Irena' OR first_name = 'Vidya' OR first_name = 'Maya') AND gender = 'M';

# Update your queries for employees whose names start and end with 'E'. Use concat() to combine their first and last name together as a single column in your results.

SELECT CONCAT(first_name, ' ', last_name) FROM employees WHERE last_name LIKE 'E%' AND last_name LIKE '%e';

SELECT * FROM employees WHERE last_name LIKE 'E%' OR last_name LIKE '%e';

SELECT * FROM employees WHERE last_name LIKE '%q%' AND last_name NOT LIKE '%qu%';

# Find all employees born on Christmas — 842 rows.

SELECT * FROM employees WHERE month(birth_date) = 12 AND day(birth_date) = 25;

# Find all employees hired in the 90s and born on Christmas — 362 rows.
SELECT * FROM employees WHERE (month(birth_date) = 12 AND day(birth_date) = 25) AND year(hire_date) between 1989 AND 2000;

# Change the query for employees hired in the 90s and born on Christmas such that the first result is the oldest employee who was hired last. It should be Khun Bernini.

SELECT * FROM employees WHERE (month(birth_date) = 12 AND day(birth_date) = 25) AND year(hire_date) between 1989 AND 2000 ORDER BY birth_date ASC, hire_date DESC;

# For your query of employees born on Christmas and hired in the 90s, use datediff() to find how many days they have been working at the company (Hint: You might also need to use now() or curdate()).

SELECT DATEDIFF(curdate(),hire_date) AS 'Days Worked' FROM employees WHERE (month(birth_date) = 12 AND day(birth_date) = 25) AND year(hire_date) between 1989 AND 2000;