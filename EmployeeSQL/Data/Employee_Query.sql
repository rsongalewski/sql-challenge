-- 1) List the following details of each employee: employee number, last name, 
-- first name, gender, and salary.
SELECT e.emp_no, e.last_name, e.first_name, e.sex, s.salary
FROM employees e
JOIN salaries s
ON (e.emp_no = s.emp_no);

-- 2) List the employees who were hired in 1986
ALTER TABLE employees
ALTER COLUMN hire_date TYPE VARCHAR;
SELECT *
FROM employees
WHERE 
	hire_date LIKE '1986%'
ORDER BY hire_date ASC;


-- 3) List the manager of each department with the following information: dept number, dept name, 
-- the manager's emp number, last name, first name
SELECT m.dept_no, d.dept_name, m.emp_no, e.last_name, e.first_name
FROM dept_manager  m
INNER JOIN employees e ON m.emp_no = e.emp_no
INNER JOIN departments d ON m.dept_no=d.dept_no;


-- 4) List the department of each employee with the following information: employee number, last name, 
-- first name, and department name
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees e
INNER JOIN dept_emp de ON e.emp_no = de.emp_no
INNER JOIN departments d ON de.dept_no = d.dept_no;


-- 5) List all employees whose first name is "Hercules" and last name begins with "B".
SELECT *
FROM employees
WHERE 
	first_name = 'Hercules'
	AND last_name LIKE 'B%';


-- 6) List all employees in the Sales department, including their employee number, last name, first name,
-- and department name.
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees e
INNER JOIN dept_emp de ON e.emp_no = de.emp_no
INNER JOIN departments d ON de.dept_no = d.dept_no
WHERE d.dept_name = 'Sales';


-- 7) List all employees in the Sales and Development departments, including their employee number,
-- last name, first name, and department name.
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees e
INNER JOIN dept_emp de ON e.emp_no = de.emp_no
INNER JOIN departments d ON de.dept_no = d.dept_no
WHERE d.dept_name = 'Sales'
	OR d.dept_name = 'Development';
	

-- 8) In descending order, list the frequency count of employee last names, i.e., how many employees
-- share each last name.
SELECT last_name, count(last_name) AS "Total per Name"
FROM employees
GROUP BY last_name
ORDER BY last_name ASC;