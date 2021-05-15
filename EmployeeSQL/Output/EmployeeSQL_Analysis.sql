select *from departments;
select *from dept_emp;
select *from dept_manager;
select *from employees;
select *from salaries;
select *from titles;


-- List the following details of each employee: employee number, last name, first name, sex, and salary.

CREATE VIEW salary AS
SELECT e.emp_no,e.last_name,e.first_name,e.sex,s.salary
FROM salaries AS s
JOIN employees AS e
ON e.emp_no = s.emp_no;

SELECT * FROM salary;

-- List first name, last name, and hire date for employees who were hired in 1986.

CREATE VIEW hire AS
SELECT first_name,last_name,hire_date
FROM employees
WHERE EXTRACT(YEAR FROM hire_date) = 1986;

SELECT * FROM hire;

-- List the manager of each department with the following information: department number,
-- department name, the manager's employee number, last name, first name.

CREATE VIEW manager AS
SELECT d.dept_no,d.dept_name,m.emp_no,e.last_name,e.first_name
FROM dept_manager AS m
JOIN departments AS d
ON d.dept_no = m.dept_no
JOIN employees AS e
ON m.emp_no = e.emp_no;

SELECT * FROM manager;

-- List the department of each employee with the following information: employee number, last name, first name, and department name.

CREATE VIEW empdetail AS
SELECT e.emp_no,e.last_name,e.first_name,d.dept_name
FROM departments AS d
JOIN dept_emp AS p
ON p.dept_no = d.dept_no
JOIN employees AS e
ON e.emp_no = p.emp_no;

SELECT * FROM empdetail;

-- List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."

CREATE VIEW hercules AS
SELECT first_name,last_name,sex
FROM employees
WHERE first_name = 'Hercules' AND last_name LIKE 'B%';

SELECT * FROM hercules;

-- List all employees in the Sales department, including their employee number, last name, first name, and department name.

CREATE VIEW sales AS
SELECT e.emp_no,e.last_name,e.first_name,d.dept_name
FROM departments AS d
JOIN dept_emp AS p
ON p.dept_no = d.dept_no
JOIN employees AS e
ON e.emp_no = p.emp_no
WHERE d.dept_name = 'Sales';

SELECT * FROM sales;


-- List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.

CREATE VIEW salesanddevelopment AS
SELECT e.emp_no,e.last_name,e.first_name,d.dept_name
FROM departments AS d
JOIN dept_emp AS p
ON p.dept_no = d.dept_no
JOIN employees AS e
ON e.emp_no = p.emp_no
WHERE d.dept_name = 'Sales' OR d.dept_name = 'Development';

SELECT * FROM salesanddevelopment;


-- In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.

CREATE VIEW lastname AS
SELECT last_name,COUNT(emp_no) AS employee_count
FROM employees
GROUP BY last_name
ORDER BY COUNT(emp_no) DESC ;

SELECT * FROM lastname;

