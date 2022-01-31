CREATE DATABASE IF NOT EXISTS join_test_db;

CREATE TABLE roles
(
    id   INT UNSIGNED NOT NULL AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE users
(
    id      INT UNSIGNED NOT NULL AUTO_INCREMENT,
    name    VARCHAR(100) NOT NULL,
    email   VARCHAR(100) NOT NULL,
    role_id INT UNSIGNED DEFAULT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (role_id) REFERENCES roles (id)
);

INSERT INTO roles (name)
VALUES ('admin');
INSERT INTO roles (name)
VALUES ('author');
INSERT INTO roles (name)
VALUES ('reviewer');
INSERT INTO roles (name)
VALUES ('commenter');

INSERT INTO users (name, email, role_id)
VALUES ('bob', 'bob@example.com', 1),
       ('joe', 'joe@example.com', 2),
       ('sally', 'sally@example.com', 3),
       ('adam', 'adam@example.com', 3),
       ('jane', 'jane@example.com', null),
       ('mike', 'mike@example.com', null);

SELECT users.name AS user_name, roles.name AS role_name
FROM users
         JOIN roles ON users.role_id = roles.id;
SELECT users.name AS user_name, roles.name AS role_name
FROM users
         LEFT JOIN roles ON users.role_id = roles.id;
SELECT users.name AS user_name, roles.name AS role_name
FROM users
         RIGHT JOIN roles ON users.role_id = roles.id;
SELECT roles.name AS 'Role', COUNT(u.role_id) AS 'Count'
from roles
         left join users u on roles.id = u.role_id
GROUP BY roles.name;



USE employees;

SELECT d.dept_name AS 'Department Name', CONCAT(e.first_name, ' ', e.last_name) AS 'Department Manager'
FROM departments AS d
         JOIN dept_manager dm ON d.dept_no = dm.dept_no
         JOIN employees e ON e.emp_no = dm.emp_no
WHERE dm.to_date > CURDATE()
ORDER BY `Department Name`;


SELECT d.dept_name AS 'Department Name', CONCAT(e.first_name, ' ', e.last_name) AS 'Department Manager'
FROM departments AS d
         JOIN dept_manager de ON d.dept_no = de.dept_no
         JOIN employees e ON e.emp_no = de.emp_no
WHERE to_date > CURDATE()
  AND e.gender = 'F'
ORDER BY `Department Name`;


SELECT t.title, COUNT(t.emp_no) AS Total
FROM titles AS t
         JOIN dept_emp de on t.emp_no = de.emp_no
         JOIN departments d on de.dept_no = d.dept_no
WHERE t.to_date > curdate()
  AND d.dept_name = 'Customer Service'
  AND de.to_date > curdate()
GROUP BY title;

SELECT d.dept_name                            AS 'Department Name',
       CONCAT(e.first_name, ' ', e.last_name) AS 'Department Manager',
       s.salary                               AS Salary
FROM departments AS d
         JOIN dept_manager de ON d.dept_no = de.dept_no
         JOIN employees e ON e.emp_no = de.emp_no
         JOIN salaries s on e.emp_no = s.emp_no
WHERE de.to_date > curdate()
  AND s.to_date > curdate()
ORDER BY d.dept_name;

SELECT CONCAT(e.first_name, ' ', e.last_name) AS Employee,
       d.dept_name                            AS Department,
       CONCAT(m.first_name, ' ', m.last_name) AS Manager
FROM employees AS e
         JOIN dept_emp de on e.emp_no = de.emp_no
         JOIN departments d on de.dept_no = d.dept_no
         JOIN dept_manager dm on d.dept_no = dm.dept_no
         JOIN employees m ON dm.emp_no = m.emp_no
WHERE de.to_date = '9999-01-01'
  AND dm.to_date = '9999-01-01'
ORDER BY d.dept_no DESC;
