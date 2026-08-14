CREATE DATABASE ORG;
SHOW DATABASES;
USE ORG;

CREATE TABLE Worker(
	WORKER_ID INT NOT NULL PRIMARY KEY AUTO_INCREMENT, 
    FIRST_NAME CHAR(25),
    LAST_NAME CHAR(25),
    SALARY INT(15), 
    JOINING_DATE DATETIME,
    DEPARTMENT CHAR(25)
);


INSERT INTO Worker 
	(WORKER_ID, FIRST_NAME, LAST_NAME, SALARY, JOINING_DATE, DEPARTMENT) VALUES 
    (001, 'Monika', 'Arora', 100000, '14-02-20 09.00.00', 'HR'),
	(002, 'Niharika', 'Verma', 80000, '14-06-11 09.00.00', 'Admin'),
	(003, 'Vishal', 'Singhal', 300000, '14-02-20 09.00.00', 'HR'),
	(004, 'Amitabh', 'Singh', 500000, '14-02-20 09.00.00', 'Admin'),
	(005, 'Vivek', 'Bhati', 500000, '14-06-11 09.00.00', 'Admin'),
	(006, 'Vipul', 'Diwan', 200000, '14-06-11 09.00.00', 'Account'),
	(007, 'Satish', 'Kumar', 75000, '14-01-20 09.00.00', 'Account'),
	(008, 'Geetika', 'Chauhan', 90000, '14-04-11 09.00.00', 'Admin');
    
    

    
	CREATE TABLE title(
		WORKER_REF_ID INT,
        WORKER_TITLE CHAR(25),
        AFFECTED_FROM DATETIME, 
        FOREIGN KEY (WORKER_REF_ID)
			REFERENCES Worker(WORKER_ID)
            ON DELETE CASCADE
		);
    
    INSERT INTO TITLE (WORKER_REF_ID, WORKER_TITLE, AFFECTED_FROM) VALUES
	(001, 'Manager', '2016-02-20 00:00:00'),
	(002, 'Executive', '2016-06-11 00:00:00'),
	(008, 'Executive', '2016-06-11 00:00:00'),
	(005, 'Manager', '2016-06-11 00:00:00'),
	(004, 'Asst. Manager', '2016-06-11 00:00:00'),
	(007, 'Executive', '2016-06-11 00:00:00'),
	(006, 'Lead', '2016-06-11 00:00:00'),
	(003, 'Lead', '2016-06-11 00:00:00');
    
    CREATE TABLE Bonus(
		WORKER_REF_ID INT, 
        BONUS_AMOUNT INT(10), 
        BONUS_DATE DATETIME,
        FOREIGN KEY (WORKER_REF_ID)
			REFERENCES Worker(WORKER_ID)
				ON DELETE CASCADE
		);
		
	INSERT INTO BONUS (WORKER_REF_ID, BONUS_AMOUNT, BONUS_DATE) VALUES
		(001, 5000, '16-02-20'),
		(002, 3000, '16-06-11'),
		(003, 4000, '16-02-20'),
		(001, 4500, '16-02-20'),
		(002, 3500, '16-06-11');
        
	insert into worker value
    (009, 'Monika', 'Arora', 100000, '14-02-20 09.00.00', null);
		
	-- DATA RETREVAL COMMANDS (DRL)
    
	-- where
    select * from worker where salary > 30000;
    -- between 
    select * from worker where salary between 30000 and 100000;
    -- in why and how ? 
    select * from worker where department = 'hr' or department = 'admin';
    select * from worker where deparment in ('hr', 'admin');
    -- is null
    select * from worker where department is null;
	-- wilecard
    select * from worker where first_name like '_i%';
	-- order by 
    select * from worker order by salary;
    select * from worker order by salary desc;
    -- distinct
    select distinct(department) from worker;
    -- group by 
    select department, count(department) from worker group by department;
    select department, avg(salary) from worker group by department;
    -- group by having, like select use where to fileter
    -- group by use having to filter 
    select department , count(department) from worker group by department having count(department) >= 2;
    
    -- DATA DEFINING LANGUAGE (DDL)
	-- primary , foreign key, unique, check , default
	create table account(
    id int primary key,
    name char(25) unique,
    age int,
    CONSTRAINT age_check CHECK (age >= 18),
    balance int, 
    CONSTRAINT balance_check CHECK (balance >=499)
    );
    
    CREATE TABLE order_table(
		ID INT PRIMARY KEY, 
        DELIVERY_DATE DATE,
        ORDER_PLACED_DATE DATE, 
        CUST_ID INT, 
        FOREIGN KEY (CUST_ID) 
			REFERENCES account(ID)
            ON DELETE CASCADE
    );
    
    select * from account; 
    insert into account(id, name, age, balance) values
    (1, 'farhan', 18, 500),
    (2, 'khan', 19, 500),
    (3, 'ahmed', 23, 500),
    (4, 'saifi', 42, 500);
    
    
    -- Alter operation 
	-- Add new coumn
    ALTER TABLE ACCOUNT ADD DEPARTMENT CHAR(25);
    -- MODIFY COL DATA TYPE 
    ALTER TABLE ACCOUNT MODIFY DEPARTMENT INT;
	DESC ACCOUNT;
    -- CHANGE COLUMN 
    ALTER TABLE ACCOUNT CHANGE COLUMN DEPARTMENT FIELD FLOAT;
    -- DROP COLUMN
    ALTER TABLE ACCOUNT DROP CHECK BALANCE_CHECK;
    ALTER TABLE ACCOUNT CHANGE COLUMN BALANCE SAVING_BALANCE FLOAT;
    -- RENAMTE TABLE
    ALTER TABLE ACCOUNT RENAME TO SAVING_ACCOUNT;

	DESC SAVING_ACCOUNT;
    
    -- DATA MANIPULATION LANGUAGE (DML)
    
    -- insert 
    -- UPDATE
	
    CREATE TABLE EMPLOYEE(
	ID INT PRIMARY KEY, 
    FIRST_NAME CHAR(25),
    LAST_NAME CHAR(25), 
    SALARY INT, 
    JOINING_DATE DATETIME, 
    DEPARTMENT CHAR(25)
    );
	
    SELECT * FROM EMPLOYEE;
	
	INSERT INTO EMPLOYEE
	(ID, FIRST_NAME, LAST_NAME, SALARY, JOINING_DATE, DEPARTMENT)
	VALUES
	(001, 'Monika', 'Arora', 100000, '14-02-20 09.00.00', 'HR'),
	(002, 'Niharika', 'Verma', 80000, '14-06-11 09.00.00', 'Admin'),
	(003, 'Vishal', 'Singhal', 300000, '14-02-20 09.00.00', 'HR'),
	(004, 'Amitabh', 'Singh', 500000, '14-02-20 09.00.00', 'Admin'),
	(005, 'Vivek', 'Bhati', 500000, '14-06-11 09.00.00', 'Admin'),
	(006, 'Vipul', 'Diwan', 200000, '14-06-11 09.00.00', 'Account'),
	(007, 'Satish', 'Kumar', 75000, '14-01-20 09.00.00', 'Account'),
	(008, 'Geetika', 'Chauhan', 90000, '14-04-11 09.00.00', 'Admin');
    
    

    -- update 
    UPDATE EMPLOYEE SET FIRST_NAME = 'FARHAN', LAST_NAME = 'AHMAD' WHERE ID = 1;
    SELECT * FROM EMPLOYEE;
    SET SQL_SAFE_UPDATES = 0; -- give admin permission 
    UPDATE EMPLOYEE SET SALARY = SALARY+1;
    
    -- delete 
    DELETE FROM EMPLOYEE WHERE ID = 4;
    
    -- REPLACE 
    REPLACE INTO EMPLOYEE (ID,FIRST_NAME, LAST_NAME) VALUES (1, 'KHAN', 'SIR');
    REPLACE INTO EMPLOYEE SET ID = 1, FIRST_NAME =  'FARHAN', LAST_NAME = 'FARHAN';
    -- ID, FIRST_NAME, DEPARTMENT KO CHOD KR BAAKI SAB NULL 
    REPLACE INTO EMPLOYEE(ID, FIRST_NAME, DEPARTMENT)
		SELECT ID, FIRST_NAME , DEPARTMENT FROM EMPLOYEE
        WHERE ID = 2;
    
	-- JOINS
    -- column wise combination , no of column change in final ouput
    CREATE TABLE EMPLOYEE(
    ID INT PRIMARY KEY,
    FNAME VARCHAR(25), 
    LNAME VARCHAR(25),
    AGE INT,
    EMAILID VARCHAR(50),
    PHONE_NO VARCHAR(50), 
    CITY CHAR(25)
    );
    
    INSERT INTO EMPLOYEE VALUES
    (1, 'Aman', 'Proto', 32, 'aman@gmail.com', '898', 'Delhi'),
	(2, 'Yagya', 'Narayan', 44, 'yagya@gmail.com', '222', 'Palam'),
	(3, 'Rahul', 'BD', 22, 'rahul@gmail.com', '444', 'Kolkata'),
	(4, 'Jatin', 'Hermit', 31, 'jatin@gmail.com', '666', 'Raipur'),
	(5, 'PK', 'Pandey', 21, 'pk@gmail.com', '555', 'Jaipur');

SELECT * FROM EMPLOYEE;
    
    
	CREATE TABLE CLIENT(
    ID INT PRIMARY KEY, 
    FIRST_NAME VARCHAR(25),
    LAST_NAME VARCHAR(25),
    AGE INT, 
    EMAIL_ID VARCHAR(50),
    PHONE_NO VARCHAR(50),
    CITY VARCHAR(25),
    EMPID INT, 
    FOREIGN KEY (EMPID)
    REFERENCES EMPLOYEE(ID)
    ON DELETE CASCADE
    );
    
    INSERT INTO CLIENT VALUES
    (1, 'Mac', 'Rogers', 47, 'mac@hotmail.com', '333', 'Kolkata', 3),
(2, 'Max', 'Poirier', 27, 'max@gmail.com', '222', 'Kolkata', 3),
(3, 'Peter', 'Jain', 24, 'peter@abc.com', '111', 'Delhi', 1),
(4, 'Sushant', 'Aggarwal', 23, 'sushant@yahoo.com', '45454', 'Hyderabad', 5),
(5, 'Pratap', 'Singh', 36, 'p@xyz.com', '77767', 'Mumbai', 2);

    
    
	CREATE TABLE PROJECT(
	ID INT PRIMARY KEY, 
    EMPID INT, 
    NAME VARCHAR(25),
    STARTDATE DATE, 
    CLIENTID INT, 
    FOREIGN KEY (EMPID)
		REFERENCES EMPLOYEE(ID)
        ON DELETE CASCADE,
	 FOREIGN KEY (CLIENTID)
		REFERENCES CLIENT(ID)
        ON DELETE CASCADE
    );
   
	INSERT INTO PROJECT VALUES 
    (1, 1, 'A', '2021-04-21', 3),
	(2, 2, 'B', '2021-03-12', 1),
	(3, 3, 'C', '2021-01-16', 5),
	(4, 3, 'D', '2021-04-27', 2),
	(5, 5, 'E', '2021-05-01', 4);
    

    -- INNER JOIN
    SELECT * FROM EMPLOYEE;
    SELECT * FROM CLIENT;
    SELECT * FROM PROJECT;
-- Enlist all the employees ID's, names along with the Project allocated to them.
	SELECT E.ID, E.FNAME, E.LNAME, P.NAME FROM EMPLOYEE AS E INNER JOIN PROJECT AS P ON E.ID = P.EMPID;
    
-- CAN WE WRITE JOIN WITHOUT USING JOIN , YES WITH WHERE;
    SELECT E.ID, E.FNAME, E.LNAME, P.NAME FROM EMPLOYEE AS E , PROJECT AS P WHERE E.ID = P.EMPID;

-- Fetch out all the employee ID’s and their contact detail who have been working
-- from Jaipur with the clients name working in Hyderabad.
	SELECT E.ID, E.EMAILID, E.PHONE_NO, C.FIRST_NAME, C.LAST_NAME FROM EMPLOYEE AS E
    INNER JOIN CLIENT AS C ON E.ID = C.EMPID WHERE E.CITY = 'JAIPUR' AND C.CITY = 'HYDERABAD';
	

-- LEFT JOIN
	-- Fetch out each project allocated to each employee.
	SELECT * FROM EMPLOYEE AS E LEFT JOIN PROJECT AS P ON E.ID = P.EMPID;

-- RIGHT JOIN
-- List out all the projects along with the employee's name and their respective allocated email ID.
	SELECT P.*, E.FNAME, E.LNAME, E.EMAILID FROM EMPLOYEE AS E RIGHT JOIN PROJECT AS P ON E.ID = P.EMPID;
   
-- set operations
	create database sets;
    use sets;
    CREATE TABLE DEPT1(
	EMPID INT PRIMARY KEY,
    NAME VARCHAR(25),
    ROLE VARCHAR(25)
    );
    
    CREATE TABLE DEPT2(
    EMPID INT PRIMARY KEY, 
    NAME VARCHAR(25),
    ROLE VARCHAR(25)
    );
   DROP TABLE DEPT2;
    
    INSERT INTO Dept1 (empid, name, role) VALUES
	(1, 'A', 'engineer'),
	(2, 'B', 'salesman'),
	(3, 'C', 'manager'),
	(4, 'D', 'salesman'),
	(5, 'E', 'engineer');

	INSERT INTO Dept2 (empid, name, role) VALUES
	(3, 'C', 'manager'),
	(6, 'F', 'marketing'),
	(7, 'G', 'salesman');
    
    SELECT * FROM DEPT2;

-- no of colum is same in set , row wise combinaiton 
-- union 
	SELECT * FROM DEPT1
    UNION 
    SELECT * FROM DEPT2;

-- intersection 
	SELECT DISTINCT * FROM DEPT1 INNER JOIN DEPT2 ON DEPT1.EMPID =  DEPT2.EMPID;
	SELECT DISTINCT * FROM DEPT1 INNER JOIN DEPT2 USING(EMPID); 

-- minus
	SELECT * FROM DEPT1 LEFT JOIN DEPT2 ON DEPT1.EMPID = DEPT2.EMPID WHERE DEPT2.EMPID IS NULL;
    
-- List out all the employees in the company
	SELECT * FROM DEPT1 
    UNION 
    SELECT * FROM DEPT2;

-- List out all the employees in all departments who work as salesman
SELECT * FROM DEPT1  WHERE ROLE = 'SALESMAN'
UNION SELECT * FROM DEPT2 WHERE ROLE = 'SALESMAN';

-- List out all the employees who work in BOTH the departments.
SELECT DISTINCT * FROM DEPT1 INNER JOIN DEPT2 USING(EMPID);

-- List out all the employees working in dept1 but not in dept2.
SELECT DEPT1.* FROM DEPT1 LEFT JOIN DEPT2 USING(EMPID) WHERE DEPT2.EMPID IS NULL;
 
 
-- SUB QUERIES 

use joins;

-- where clause WITHIN same table
-- employee with age > 30
SELECT * FROM EMPLOYEE WHERE AGE IN (SELECT AGE FROM EMPLOYEE WHERE AGE > 30);
-- WHERE CLAUSE DIFF TABLE
-- EMP DETAILS WORKING IN MORE THAN 1 PROJECTS
SELECT * FROM PROJECT;
SELECT * FROM EMPLOYEE WHERE ID IN (SELECT EMPID FROM PROJECT GROUP BY EMPID HAVING COUNT(EMPID)>1);


-- SINGLE VALUE SUBQUERY
--  EMP DETAILS HAVING AGE > AVG(AGE)
SELECT AVG(AGE) FROM EMPLOYEE;
SELECT * FROM EMPLOYEE WHERE AGE > (SELECT AVG(AGE) FROM EMPLOYEE);

-- FROM CLAUSE -> we have to give alias in dervied table
-- SELECT MAX AGE PERSON WHOSE FIRST NAME contains A 
SELECT * FROM EMPLOYEE; 
SELECT MAX(AGE) FROM (SELECT * FROM EMPLOYEE WHERE FNAME LIKE '%a%') as E;

-- corrleated sub queries 
-- inner query that refer the outer query 
-- find third oldest
-- INNER QUERY RUN MANY TIMES DEPEDNING ON OUTQUERY, QOUTER QUERY RUN ONE TIME 
SELECT * FROM EMPLOYEE AS E1
WHERE 3  = (
	SELECT COUNT(E2.AGE) FROM EMPLOYEE AS E2
    WHERE E2.AGE >= E1.AGE
);








    
