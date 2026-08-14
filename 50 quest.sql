CREATE DATABASE PRAC;
USE PRAC;

	CREATE TABLE WORKER(
	WORKER_ID INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
	FIRST_NAME VARCHAR(25),
	LAST_NAME VARCHAR(25),
	SALARY INT(15),
	JOINING_DATE DATETIME,
	DEPARTMENT VARCHAR(15)
	);

	INSERT INTO WORKER VALUES
	(1, 'Monika', 'Arora', 100000, '2014-02-20 09:00:00', 'HR'),
	(2, 'Niharika', 'Verma', 80000, '2014-06-11 09:00:00', 'Admin'),
	(3, 'Vishal', 'Singhal', 300000, '2014-02-20 09:00:00', 'HR'),
	(4, 'Amitabh', 'Singh', 500000, '2014-02-20 09:00:00', 'Admin'),
	(5, 'Vivek', 'Bhati', 500000, '2014-06-11 09:00:00', 'Admin'),
	(6, 'Vipul', 'Diwan', 200000, '2014-06-11 09:00:00', 'Account'),
	(7, 'Satish', 'Kumar', 75000, '2014-01-20 09:00:00', 'Account'),
	(8, 'Geetika', 'Chauhan', 90000, '2014-04-11 09:00:00', 'Admin');

	CREATE TABLE BONUS(
	WORKER_REF_ID INT, 
	BONUS_AMOUNT INT(10),
	BONUS_DATE DATETIME,
	FOREIGN KEY (WORKER_REF_ID) 
	REFERENCES WORKER(WORKER_ID)
	ON DELETE CASCADE
	);
    
    INSERT INTO BONUS VALUES 
    (1, 5000, '2016-02-20'),
	(2, 3000, '2016-06-11'),
	(3, 4000, '2016-02-20'),
	(1, 4500, '2016-02-20'),
	(2, 3500, '2016-06-11');
    

	CREATE TABLE TITLE(
	WORKER_REF_ID INT, 
	WORKER_TITLE VARCHAR(25), 
	AFFECTED_FROM DATETIME,
	FOREIGN KEY (WORKER_REF_ID) 
	REFERENCES WORKER(WORKER_ID)
	ON DELETE CASCADE
	);
    
    INSERT INTO TITLE VALUES
    (1, 'Manager', '2016-02-20'),
	(2, 'Executive', '2016-06-11'),
	(8, 'Executive', '2016-06-11'),
	(5, 'Manager', '2016-06-11'),
	(4, 'Asst. Manager', '2016-06-11'),
	(7, 'Executive', '2016-06-11');
    
    select * from worker;
    select * from bonus;
    select * from title;
    
  
-- Q-1. Write an SQL query to fetch “FIRST_NAME” from Worker table using the alias name as <WORKER_NAME>.
	SELECT FIRST_NAME AS WORKER_NAME FROM WORKER; 
-- Q-2. Write an SQL query to fetch “FIRST_NAME” from worker table in upper case.
	SELECT UPPER (FIRST_NAME) FROM WORKER;
-- Q-3. Write an SQL query to fetch unique values of DEPARTMENT from Worker table.
	select distinct department from worker;
    select department from worker group by department;
-- Q-4. Write an SQL query to print the first three characters of FIRST_NAME from Worker table.
	SELECT SUBSTRING(FIRST_NAME, 1, 3) FROM WORKER;
-- Q-5. Write an SQL query to find the position of the alphabet (‘b’) in the first name column ‘Amitabh’ from Worker table.
	SELECT INSTR(FIRST_NAME, 'B') FROM WORKER WHERE FIRST_NAME = 'AMITABH';
-- Q-6. Write an SQL query to print the FIRST_NAME from Worker table after removing white spaces from the right side.
	SELECT RTRIM(FIRST_NAME) FROM WORKER;
-- Q-7. Write an SQL query to print the DEPARTMENT from Worker table after removing white spaces from the left side.
	SELECT LTRIM(FIRST_NAME) FROM WORKER;
-- Q-8. Write an SQL query that fetches the unique values of DEPARTMENT from Worker table and prints its length.
	SELECT DISTINCT LENGTH(DEPARTMENT) FROM WORKER;
-- Q-9. Write an SQL query to print the FIRST_NAME from Worker table after replacing ‘a’ with ‘A’.
	SELECT REPLACE(FIRST_NAME, 'a', 'A') FROM WORKER; 
-- Q-10. Write an SQL query to print the FIRST_NAME and LAST_NAME from Worker table into a single column COMPLETE_NAME.
	SELECT concat(FIRST_NAME ,' ', LAST_NAME) as complete_name FROM WORKER;
-- Q-11. Write an SQL query to print all Worker details from the Worker table order by FIRST_NAME Ascending.
	SELECT * FROM WORKER ORDER BY FIRST_NAME;
-- Q-12. Write an SQL query to print all Worker details from the Worker table order by
-- FIRSTNAME Ascending and DEPARTMENT descending
	SELECT * FROM WORKER ORDER BY FIRST_NAME ASC ,  LAST_NAME DESC;
-- Q-13. Write an SQL query to print details for Workers with the first name as “Vipul” and “Satish” from Worker table.
	SELECT * FROM WORKER WHERE FIRST_NAME = 'VIPUL' OR FIRST_NAME = 'SATISH';
    SELECT * FROM WORKER WHERE FIRST_NAME IN ('VIPUL' , 'SATISH');
-- Q-14. Write an SQL query to print details of workers excluding first names, “Vipul” and “Satish” from Worker table.
	SELECT * FROM WORKER WHERE  NOT FIRST_NAME = 'VIPUL' AND NOT FIRST_NAME = 'SATISH';
    SELECT * FROM WORKER WHERE FIRST_NAME NOT IN ('VIPUL' , 'SATISH');
-- Q-15. Write an SQL query to print details of Workers with DEPARTMENT name as “Admin*”. E.G ADMINISTRATOR
	SELECT * FROM WORKER WHERE DEPARTMENT LIKE 'ADMIN%';
	SELECT * FROM WORKER WHERE DEPARTMENT = 'ADMIN';
-- Q-16. Write an SQL query to print details of the Workers whose FIRST_NAME contains ‘a’.
	SELECT * FROM WORKER WHERE FIRST_NAME LIKE '%A%';
-- Q-17. Write an SQL query to print details of the Workers whose FIRST_NAME ends with ‘a’.
	SELECT * FROM WORKER WHERE FIRST_NAME LIKE '%A';
-- Q-18. Write an SQL query to print details of the Workers whose FIRST_NAME ends with ‘h’ and contains six alphabets.
	SELECT * FROM WORKER WHERE FIRST_NAME LIKE '%H' AND LENGTH(FIRST_NAME) = 6;
    SELECT * FROM WORKER WHERE FIRST_NAME LIKE '_____H';
-- Q-19. Write an SQL query to print details of the Workers whose SALARY lies between 100000 and 500000.
	SELECT * FROM WORKER WHERE SALARY BETWEEN 100000 AND 500000;
-- Q-20. Write an SQL query to print details of the Workers who have joined in Feb’2014.
	SELECT * FROM WORKER WHERE JOINING_DATE LIKE '2014-02%';
    SELECT * FROM WORKER WHERE YEAR(JOINING_DATE) = 2014 AND MONTH(JOINING_DATE) = 02;
-- Q-21. Write an SQL query to fetch the count of employees working in the department ‘Admin’.
	SELECT * FROM WORKER;
    SELECT DEPARTMENT, COUNT(*) FROM WORKER WHERE DEPARTMENT='ADMIN';
-- Q-22. Write an SQL query to fetch worker full names with salaries >= 50000 and <= 100000.
	SELECT CONCAT(FIRST_NAME, ' ', LAST_NAME) FROM WORKER WHERE SALARY BETWEEN 50000 AND 100000;
-- Q-23. Write an SQL query to fetch the no. of workers for each department in the descending order.
	SELECT DEPARTMENT , COUNT(WORKER_ID) AS NO_OF_WORKERS FROM WORKER GROUP BY DEPARTMENT ORDER BY NO_OF_WORKERS DESC;
-- Q-24. Write an SQL query to print details of the workers who are also Managers.
	SELECT * FROM TITLE;
    SELECT * FROM BONUS;
	SELECT WORKER.* FROM WORKER INNER JOIN TITLE ON WORKER.WORKER_ID = TITLE.WORKER_REF_ID WHERE WORKER_TITLE = 'MANAGER';
-- Q-25. Write an SQL query to fetch number (more than 1) of same titles in the ORG of different types.
	SELECT WORKER_TITLE, COUNT(*) AS count FROM TITLE GROUP BY WORKER_TITLE HAVING COUNT > 1;
-- Q-26. Write an SQL query to show only odd rows from a table.
	SELECT * FROM WORKER WHERE MOD (WORKER_ID, 2)!=0;
-- Q-27. Write an SQL query to show only even rows from a table.
	SELECT * FROM WORKER WHERE MOD (WORKER_ID, 2)!=1;
-- Q-28. Write an SQL query to clone a new table from another table.
	CREATE TABLE WORKER_CLONE LIKE WORKER;
    SELECT * FROM WORKER_CLONE;
    INSERT INTO WORKER_CLONE SELECT * FROM WORKER;
-- Q-29. Write an SQL query to fetch intersecting records of two tables.
	-- minus 
    SELECT * FROM WORKER INNER JOIN WORKER_CLONE USING(WORKER_ID);
-- Q-30. Write an SQL query to show records from one table that another table does not have.
	SELECT * FROM WORKER LEFT JOIN WORKER_CLONE USING(WORKER_ID) WHERE WORKER_CLONE.WORKER_ID IS NULL;
-- Q-31. Write an SQL query to show the current date and time.
	SELECT CURDATE();
    SELECT NOW();
-- Q-32. Write an SQL query to show the top n (say 5) records of a table order by descending salary.
	SELECT *  FROM WORKER ORDER BY SALARY DESC LIMIT 5;
-- Q-33. Write an SQL query to determine the nth (say n=5) highest salary from a table.
		SELECT * FROM WORKER ORDER BY SALARY DESC LIMIT 4, 1; -- N-1 CHODKR USKE AAGE KA 
-- Q-34. Write an SQL query to determine the 5th highest salary without using LIMIT keyword.
	SELECT * FROM WORKER ORDER BY SALARY DESC; 
	SELECT * FROM WORKER AS W1
    WHERE 5 = (SELECT COUNT(DISTINCT(SALARY)) FROM WORKER AS W2 WHERE W2.SALARY>=W1.SALARY);
    
-- Q-35. Write an SQL query to fetch the list of employees with the same salary.
	SELECT SALARY, COUNT(*) AS SAME_SALARY FROM WORKER GROUP BY SALARY;
    SELECT w1.* FROM WORKER AS W1 , WORKER AS W2 WHERE W1.SALARY = W2.SALARY AND W1.WORKER_ID!=W2.WORKER_ID;
-- Q-36. Write an SQL query to show the second highest salary from a table using sub-query.
	select * from worker order by salary desc;
	select * from worker as w1 
    where 2 = (select count(distinct(salary)) from worker as w2 where w2.salary>=w1.salary);
    select max(salary) from worker where salary not in(select max(salary) from worker);
-- Q-37. Write an SQL query to show one row twice in results from a table.
	select * from worker 
    union all 
    select * from worker order by worker_id;
-- Q-38. Write an SQL query to list worker_id who does not get bonus.
	-- join
    select WORKER_ID from worker as w1 
    left join 
    bonus as b1 on w1.worker_id = b1.worker_ref_id 
    where b1.worker_ref_id is null;
	-- sub quries
    SELECT WORKER_ID FROM WORKER AS W WHERE W.WORKER_ID NOT IN (SELECT WORKER_REF_ID FROM BONUS);
-- Q-39. Write an SQL query to fetch the first 50% records from a table.
	SELECT * FROM WORKER;
	SELECT * FROM WORKER WHERE WORKER_ID <= (SELECT COUNT(WORKER_ID)/2 FROM WORKER );
-- Q-40. Write an SQL query to fetch the departments that have less than 4 people in it.
	SELECT COUNT(DEPARTMENT) FROM WORKER GROUP BY DEPARTMENT HAVING COUNT(DEPARTMENT) <4; 
-- Q-41. Write an SQL query to show all departments along with the number of people in there.
	SELECT DEPARTMENT , COUNT(DEPARTMENT) FROM WORKER GROUP BY DEPARTMENT; 
-- Q-42. Write an SQL query to show the last record from a table.
	SELECT * FROM WORKER WHERE WORKER_ID = (SELECT MAX(WORKER_ID) FROM WORKER);
-- Q-43. Write an SQL query to fetch the first row of a table.
	SELECT * FROM WORKER WHERE WORKER_ID = (SELECT MIN(WORKER_ID) FROM WORKER);
-- Q-44. Write an SQL query to fetch the last five records from a table.
	SELECT * FROM WORKER WHERE WORKER_ID > (SELECT COUNT(WORKER_ID) FROM WORKER) - 5;
    (SELECT * FROM WORKER ORDER BY WORKER_ID DESC LIMIT 5) ORDER BY WORKER_ID;
-- Q-45. Write an SQL query to print the name of employees having the highest salary in each department.
	SELECT W.FIRST_NAME, W.DEPARTMENT, W.SALARY 
    FROM (SELECT MAX(SALARY) AS MAXSAL, DEPARTMENT FROM WORKER GROUP BY DEPARTMENT) AS TEMP
    INNER JOIN WORKER AS W ON TEMP.DEPARTMENT = W.DEPARTMENT AND TEMP.MAXSAL = W.SALARY;
		
	SELECT W1.FIRST_NAME, W1.LAST_NAME, W1.DEPARTMENT, W1.SALARY
	FROM WORKER AS W1
	WHERE W1.SALARY = (
		SELECT MAX(W2.SALARY)
		FROM WORKER AS W2
		WHERE W2.DEPARTMENT = W1.DEPARTMENT
	);
-- Q-46. Write an SQL query to fetch three max salaries from a table using co-related subquery.
	SELECT SALARY FROM WORKER ORDER BY SALARY desc;
	(SELECT DISTINCT SALARY FROM WORKER AS W
    WHERE 3>= (SELECT COUNT(DISTINCT SALARY) FROM WORKER AS W2 WHERE W.SALARY<=W2.SALARY) ) ORDER BY SALARY DESC;
-- Q-47. Write an SQL query to fetch three min salaries from a table using co-related subquery.
	SELECT DISTINCT SALARY FROM WORKER AS W 
    WHERE 3>=(SELECT COUNT(DISTINCT SALARY) FROM WORKER AS W2 WHERE W.SALARY >= W2.SALARY);
-- Q-48. Write an SQL query to fetch nth max salaries from a table.
	SELECT * FROM WORKER ORDER BY SALARY DESC LIMIT 6,1;
	SELECT DISTINCT SALARY FROM WORKER AS W
    where 2 = (select count(distinct salary ) from worker as w2 where w.salary <= w2.salary); -- dry run krke dekh
    
-- Q-49. Write an SQL query to fetch departments along with the total salaries paid for each of them.
	select sum(salary) , department from worker group by department;

-- Q-50. Write an SQL query to fetch the names of workers who earn the highest salary.
	select first_name from worker where salary= (select max(salary) from worker);

    







    