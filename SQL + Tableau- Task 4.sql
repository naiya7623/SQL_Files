# Task 4: Average salary of male and female employees within a certain salary range across departments through stored procedure

DROP PROCEDURE IF EXISTS  filter_avg_salary;

DELIMITER $$ 
CREATE PROCEDURE 
	filter_avg_salary (IN  min_salary FLOAT, IN max_salary FLOAT)
BEGIN
 
SELECT
	e.gender, 
    d.dept_name, 
    AVG(s.salary) AS avg_salary
FROM
	t_salaries s 
		JOIN 
	t_employees e ON s.emp_no = e.emp_no
		JOIN 
	t_dept_emp de ON de.emp_no = e.emp_no
		JOIN 
	t_departments d ON d.dept_no = de.dept_no
	WHERE s.salary BETWEEN min_salary AND max_salary
GROUP BY d.dept_no, e.gender;
END $$  

DELIMITER ;

CALL filter_avg_salary(25000, 75000);