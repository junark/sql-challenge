---DROP TABLE --;

--Create a new table
CREATE TABLE departments (
	dept_no VARCHAR (30),
	dept_name VARCHAR (30)
);

--call table
SELECT * FROM departments;

CREATE TABLE dept_emp (
	emp_no INT,
	dept_no VARCHAR (30)
);

--call table
SELECT * FROM dept_emp;

CREATE TABLE dept_manager (
	dept_no VARCHAR (30),
	emp_no INT	
);

--call table
SELECT * FROM dept_manager;

CREATE TABLE employees (
	emp_no INT,
	emp_title_id VARCHAR (30),
	birth_date VARCHAR(30),
	first_name VARCHAR(30),
	last_name VARCHAR(30),
	sex VARCHAR(5),
	hire_date VARCHAR(30)
);

--call table
SELECT * FROM employees;


CREATE TABLE salaries (
	emp_no INT,
	salary INT
);

--call table
SELECT * FROM salaries;

CREATE TABLE titles (
	title_id VARCHAR (30), 
	title VARCHAR (30)
);

--call table
SELECT * FROM titles;

CREATE TABLE nebulas(
	name VARCHAR (30), 
	exposure_minutes int
);

--1. List the following details of each employee: employee number, last name, first name, sex, and salary.
--filter and join
SELECT employees.emp_no, employees.last_name, employees.first_name, employees.sex, salaries.salary
FROM salaries
INNER JOIN employees ON
employees.emp_no=salaries.emp_no;


--2. List first name, last name, and hire date for employees who were hired in 1986.
--filter only
SELECT first_name, last_name, hire_date
FROM employees
WHERE hire_date LIKE '%1986%';

--3. List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name.
SELECT departments.dept_no, departments.dept_name, dept_manager.emp_no, employees.last_name, employees.first_name
FROM departments
INNER JOIN dept_manager ON
departments.dept_no=dept_manager.dept_no
JOIN employees ON
dept_manager.emp_no=employees.emp_no;

--4. List the department of each employee with the following information: employee number, last name, first name, and department name.
SELECT employees.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM employees
INNER JOIN dept_emp ON
employees.emp_no=dept_emp.emp_no
JOIN departments ON
dept_emp.dept_no=departments.dept_no;

--5. List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
SELECT first_name, last_name, sex
FROM employees
WHERE last_name LIKE 'B%'
AND first_name = 'Hercules';

--6. List all employees in the Sales department, including their employee number, last name, first name, and department name.

SELECT  employees.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM employees
INNER JOIN dept_emp ON
dept_emp.emp_no=employees.emp_no
JOIN departments ON
dept_emp.dept_no=departments.dept_no
WHERE departments.dept_name = 'Sales';

--7. List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT  employees.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM employees
INNER JOIN dept_emp ON
dept_emp.emp_no=employees.emp_no
JOIN departments ON
dept_emp.dept_no=departments.dept_no
WHERE departments.dept_name = 'Sales'
OR departments.dept_name = 'Development';

--8. In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
SELECT first_name, COUNT(first_name) AS "employee count"
FROM employees
GROUP BY first_name
ORDER BY "employee count" DESC;

