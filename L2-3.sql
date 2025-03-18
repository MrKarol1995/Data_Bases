--LISTA 3
-- zad 2
SELECT COUNT(DISTINCT title) FROM employees.titles;
-- zad 1
SELECT COUNT(DISTINCT emp_no) FROM employees.dept_emp
WHERE to_date >= CURRENT_DATE;
--zad3
SELECT AVG(salary) 
as srednia_pensja, STD(salary) 
as odchylenie_standardowe 
FROM employees.salaries
WHERE to_date >= CURRENT_DATE
and emp_no IN (SELECT emp_no FROM employees.titles
WHERE title = 'Senior Engineer');

--LISTA 2

--zad 2.6

SELECT count(title) FROM film
WHERE (description like '% SUMO %'
or description like '% SUMO'
or description like 'SUMO %');
-- description RLIKE "\\b[Ss]umo\\b";

--2.7

SELECT count(title) FROM film
WHERE description RLIKE ("\\b[Dd]og\\b")
and description RLIKE ("\\b[Cc]at\\b");