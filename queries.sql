-- Q1) List the following details of each employee: employee number, last name, first name, sex, and salary.
create view Q1 as 
select e.emp_no, e.last_name, e.first_name, e.sex, s.salary
from employees as e
inner join salaries as s
	on (e.emp_no = s.emp_no);
	
-- Q2 List first name, last name, and hire date for employees who were hired in 1986.
create view Q2 as 
select e.last_name, e.first_name, e.hire_date 
from employees as e
where e.hire_date between('1986-01-01') and ('1986-12-31')
order by e.hire_date;

-- Q3 List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name.
create view Q3 as
select mng.dept_no, dpt.dept_name, mng.emp_no, e.last_name, e.first_name
from dept_manager as mng
inner join departments as dpt
	on mng.dept_no = dpt.dept_no
		inner join employees as e
			on mng.emp_no = e.emp_no
order by e.last_name;
	
-- Working...Q4 List the department of each employee with the following information: employee number, last name, first name, and department name.
create view Q4 as 
select e.emp_no, e.last_name, e.first_name, dpt.dept_name
from employees as e
inner join dept_emp as de
	on (e.emp_no = de.emp_no)
	inner join departments as dpt
		on(dpt.dept_no = de.dept_no) 
order by e.last_name;

-- Q5 List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
create view Q5 as
select first_name, last_name, sex
from employees
where first_name = 'Hercules' 
and last_name like 'B%' 


-- Q6 List all employees in the Sales department, including their employee number, last name, first name, and department name.
create view Q6 as 
select e.last_name, e.first_name, e.emp_no, dpt.dept_name
from employees as e
inner join dept_emp as de
	on (e.emp_no = de.emp_no)
	inner join departments as dpt
		on(dpt.dept_no = de.dept_no) 
where dpt.dept_name = 'Sales'
order by e.last_name;


-- Q7 List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
create view Q7 as 
select e.last_name, e.first_name, e.emp_no, dpt.dept_name
from employees as e
inner join dept_emp as de
	on (e.emp_no = de.emp_no)
	inner join departments as dpt
		on(dpt.dept_no = de.dept_no) 
where dpt.dept_name in ('Sales', 'Development')
order by e.last_name;






-- Q8 In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
create view Q8 as 
select last_name, count(last_name)
from employees 
group by last_name
order by count(last_name) desc;

