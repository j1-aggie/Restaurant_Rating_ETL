
--Answer questions based on imported data

--List the following details of each employee: employee number, last name, first name, sex, and salary.

SELECT employees.last_name, employees.first_name, employees.gender, salaries.salary, employees.emp_no
FROM employees
INNER JOIN salaries
ON salaries.emp_no = employees.emp_no;


--List first name, last name, and hire date for employees who were hired in 1986.

SELECT employees.first_name, employees.last_name, employees.hire_date
FROM employees
Where extract(year from hire_date)= '1986'
ORDER BY hire_date NULLS LAST;

--List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name.

SELECT dept_manager.dept_no, departments.dept_name, dept_manager.emp_no, employees.last_name, employees.first_name
FROM dept_manager
LEFT JOIN departments
ON dept_manager.dept_no = departments.dept_no
LEFT JOIN employees
ON dept_manager.emp_no = employees.emp_no;

--List the department of each employee with the following information: employee number, last name, first name, and department name.

SELECT departments.dept_name, employees.last_name, employees.first_name, employees.emp_no
FROM dept_emp
LEFT JOIN departments
ON dept_emp.dept_no = departments.dept_no
LEFT JOIN employees
ON dept_emp.emp_no = employees.emp_no
ORDER BY departments.dept_name NULLS LAST;


--List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."

SELECT first_name, last_name, gender
FROM employees
WHERE first_name = 'Hercules' and last_name like 'B%';

--List all employees in the Sales department, including their employee number, last name, first name, and department name.

SELECT departments.dept_name, employees.last_name, employees.first_name, employees.emp_no
FROM dept_emp
LEFT JOIN departments
ON dept_emp.dept_no = departments.dept_no
LEFT JOIN employees
ON dept_emp.emp_no = employees.emp_no
WHERE departments.dept_name = 'Sales'

--List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.

SELECT departments.dept_name, employees.last_name, employees.first_name, employees.emp_no
FROM dept_emp
LEFT JOIN departments
ON dept_emp.dept_no = departments.dept_no
LEFT JOIN employees
ON dept_emp.emp_no = employees.emp_no
WHERE departments.dept_name = 'Sales' or departments.dept_name = 'Development'


--In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.

SELECT last_name, COUNT(last_name) AS "last_name_frequency"
FROM employees
GROUP BY last_name
ORDER BY "last_name_frequency" DESC NULLS LAST;