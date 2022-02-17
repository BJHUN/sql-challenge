CREATE TABLE "departments" (
    "dept_no" VARCHAR   NOT NULL,
    "dept_name" VARCHAR   NOT NULL,
    primary key(dept_no),
	unique(dept_name)
);
-- 
CREATE TABLE "titles" (
    "title_id" VARCHAR   NOT NULL,
    "title" VARCHAR   NOT NULL,
    PRIMARY KEY ("title_id")	
);
---------
CREATE TABLE "employees" (
    "emp_no" INT   NOT NULL,
    "emp_title_id" VARCHAR   NOT NULL,
    "birth_date" DATE   NOT NULL,
    "first_name" VARCHAR   NOT NULL,
    "last_name" VARCHAR   NOT NULL,
    "sex" VARCHAR   NOT NULL,
    "hire_date" DATE   NOT NULL,
    PRIMARY KEY ("emp_no"),
	foreign key ("emp_title_id") references titles(title_id)
);
-- ---------
CREATE TABLE "dept_emp" (
    "emp_no" INT   NOT NULL,
    "dept_no" VARCHAR   NOT NULL,
    PRIMARY KEY ("emp_no","dept_no"),
	foreign key ("emp_no") references employees(emp_no),
	foreign key ("dept_no") references departments(dept_no)
);
-- 
CREATE TABLE "dept_manager" (
    "dept_no" VARCHAR   NOT NULL,
    "emp_no" INT   NOT NULL,
     PRIMARY KEY ("dept_no","emp_no"),
	 foreign key ("emp_no") references employees(emp_no),
	 foreign key ("dept_no") references departments(dept_no) 
);
-- 
CREATE TABLE "salaries" (
    "emp_no" INT   NOT NULL,
    "salary" INT   NOT NULL,
	primary key("emp_no","salary"),
	foreign key("emp_no") references employees(emp_no)
);
-- 




