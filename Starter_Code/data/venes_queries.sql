--List the employee number, last name, first name, sex, and salary
--of each employee

SELECT
	e.emp_no,
	e.last_name,
	e.first_name,
	e.sex,
	s.salary
FROM
	employees e 
	join salaries s on e.emp_no = s.emp_no
Order by
	e.last_name ASC,
	s.salary DESC;

--List the first name, last name, and hire date for the employees
--who were hired in 1986

SELECT
	e.first_name,
	e.last_name,
	e.sex
FROM
	employees e
WHERE
	e.first_name = 'Hercules'
	and e.last_name like 'B%'
ORDER BY
	e.last_name ASC,
	e.first_name ASC;

--List the manager of each department along with their department number,
--department name, employee number, last name, and first name

SELECT
    dm.dept_no,
    d.dept_name,
    dm.emp_no,
    e.last_name,
    e.first_name
FROM
    dept_manager dm
INNER JOIN
    departments d ON dm.dept_no = d.dept_no
INNER JOIN
    employees e ON dm.emp_no = e.emp_no;

--List the department number for each employee along with that employee’s
--employee number, last name, first name, and department name

SELECT
    e.emp_no,
    e.last_name,
    e.first_name,
    d.dept_name
FROM
    employees e
INNER JOIN
    dept_emp de ON e.emp_no = de.emp_no
INNER JOIN
    departments d ON de.dept_no = d.dept_no
ORDER BY
    e.emp_no;

--List first name, last name, and sex of each employee whose first name
--is Hercules and whose last name begins with the letter B
SELECT
    first_name,
    last_name,
    birth_date,
    sex
FROM
    employees
WHERE
    first_name = 'Hercules'
    AND last_name LIKE 'B%';

--List each employee in the Sales department, including their employee
--number, last name, and first name

SELECT
    e.emp_no,
    e.last_name,
    e.first_name,
    d.dept_name
FROM
    employees e
INNER JOIN
    dept_emp de ON e.emp_no = de.emp_no
INNER JOIN
    departments d ON de.dept_no = d.dept_no
WHERE
    d.dept_name = 'Sales'
ORDER BY
    e.emp_no;

--List each employee in the Sales and Development departments, including
--their employee number, last name, first name, and department name

SELECT
    e.emp_no,
    e.last_name,
    e.first_name,
    d.dept_name
FROM
    employees e
INNER JOIN
    dept_emp de ON e.emp_no = de.emp_no
INNER JOIN
    departments d ON de.dept_no = d.dept_no
WHERE
    d.dept_name IN ('Sales', 'Development')
ORDER BY
    e.emp_no;

--List the frequency counts, in descending order, of all the employee last
--names (that is, how many employees share each last name)

SELECT
    last_name,
    COUNT(last_name)
FROM
    employees
GROUP BY
    last_name
ORDER BY
    COUNT(last_name) DESC;
