create database temp;
use temp;
create table Pairs(
A INT , 
B INT
);

INSERT INTO PAIRS VALUES (1,2),(2, 4),(2, 1),(3, 2),(4,2),(5,6),(6,5),(7,8);	
SELECT * FROM PAIRS;

-- Q - REMOVE ALL THE REVERESED NUMBER PAIRS FROM GIVEN TABLE

-- METHOND 1 USING JOINS;
select lt.* from pairs lt left join pairs rt on lt.a = rt.b and lt.b=rt.a
where rt.a is null or rt.a > lt.a;

-- methond 2 using corelated sub query 
select * from pairs p1 where not exists
(select * from pairs p2 where p1.a=p2.b and p1.b = p2.a and p1.a > p2.a);