# Task 1: Number of male and female employees from each year starting 1990

SELECT 
    YEAR(d.from_date) AS calender_year,
    e.gender,
    COUNT(e.emp_no) AS number_of_employees
FROM
    t_employees e
        JOIN
    t_dept_emp d ON d.emp_no = e.emp_no
GROUP BY calender_year , e.gender
HAVING calender_year >= 1990;

