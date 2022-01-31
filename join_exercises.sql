USE employees;

SELECT d.dept_name AS 'Department Name', CONCAT(e.first_name, ' ', e.last_name) AS 'Department Manager'
FROM departments AS d
JOIN dept_manager de ON d.dept_no = de.dept_no
JOIN employees e ON e.emp_no = de.emp_no
WHERE to_date = '9999-01-01'
ORDER BY `Department Name`;


SELECT d.dept_name AS 'Department Name', CONCAT(e.first_name, ' ', e.last_name) AS 'Department Manager'
FROM departments AS d
JOIN dept_manager de ON d.dept_no = de.dept_no
JOIN employees e ON e.emp_no = de.emp_no
WHERE to_date = '9999-01-01' AND e.gender = 'F'
ORDER BY `Department Name`;


SELECT title, COUNT(*) AS Total
FROM titles AS t
JOIN dept_emp de on de.emp_no = t.emp_no
JOIN departments d on d.dept_no = de.dept_no
WHERE t.to_date = '9999-01-01' AND d.dept_name = 'Customer Service'
GROUP BY title;

SELECT d.dept_name AS 'Department Name', CONCAT(e.first_name, ' ', e.last_name) AS 'Department Manager', s.salary AS Salary
FROM departments AS d
JOIN dept_manager de ON d.dept_no = de.dept_no
JOIN employees e ON e.emp_no = de.emp_no
JOIN salaries s on e.emp_no = s.emp_no
WHERE de.to_date = '9999-01-01' AND s.to_date = '9999-01-01'
ORDER BY d.dept_name;

SELECT CONCAT(e.first_name, ' ' ,e.last_name ) AS Employee, d.dept_name AS Department, CONCAT(m.first_name, ' ' ,m.last_name ) AS Manager
FROM employees AS e
JOIN dept_emp de on e.emp_no = de.emp_no
JOIN departments d on de.dept_no = d.dept_no
JOIN dept_manager dm on d.dept_no = dm.dept_no
JOIN employees m ON dm.emp_no = m.emp_no
WHERE de.to_date = '9999-01-01' AND dm.to_date = '9999-01-01'
ORDER BY d.dept_no DESC ;
