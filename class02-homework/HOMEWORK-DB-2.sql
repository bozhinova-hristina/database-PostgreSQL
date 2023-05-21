
--Homework requirement 1/6
--Find all Employees with FirstName = Antonio
SELECT * FROM employee e
WHERE firstname = 'Antonio'

--Find all Employees with DateOfBirth greater than ‘01.01.1979’
SELECT * FROM employee e
WHERE dateofbirth > '1979-01-01'

--Find all Male Employees
SELECT * FROM employee e 
WHERE gender = 'M'

--Find all Employees with LastName starting With ‘T'
SELECT * FROM employee e 
WHERE lastname LIKE 'M%'

--Find all Employees hired in January/1988
SELECT * FROM employee e
WHERE hiredate  >= '1988-01-01' AND hiredate  <=  '1988-01-31'

--Find all Employees with LastName starting With ‘J’ hired in
--January/1988
SELECT * FROM employee e 
WHERE lastname LIKE 'J%' AND hiredate  >= '1988-01-01' AND hiredate  <=  '1988-01-31'


--Homework requirement 2/6
--• Find all Employees with FirstName = Antonio ordered by Last Name
SELECT * FROM employee e
WHERE firstname = 'Antonio' 
ORDER BY lastname ASC

--• List all Employees ordered by FirstName
SELECT * FROM employee e
ORDER BY firstname ASC

--• Find all Male employees ordered by HireDate, starting from the last
--hired
SELECT * FROM employee e 
WHERE gender = 'M'
ORDER BY hiredate DESC


--Homework requirement 3/6
--• List all Business Entity region and Customer region names in single
--result set WITH duplicates

SELECT region  FROM businessentity b  
UNION ALL 
SELECT regionname FROM customer c

--• List all Business Entity region and Customer region names in single
--result set WITHOUT duplicates
SELECT region  FROM businessentity b  
UNION 
SELECT regionname FROM customer c

--• List all common region names between Business Entities and
--Customers
SELECT region  FROM businessentity b  
INTERSECT
SELECT regionname FROM customer c



--Homework requirement 4/6
--• Provide create table script for the Order table where it won’t allow an
--orderDate before 01.01.2010
CREATE TABLE "Order" (
id serial PRIMARY KEY NOT NULL,
orderdate date CHECK (orderdate > '2010-01-01')
)



--• Provide create table script for the Product table where the price will
--always be AT LEAST 20% higher than the cost
--• Provide create table script for the Product table where all description
--values will be UNIQUE
CREATE TABLE product (
id serial PRIMARY KEY,
price int CHECK(price > (COST*1.2))NOT NULL,
COST int NOT NULL,
description varchar(50) UNIQUE NOT NULL
)


--Homework requirement 5/6
--• Create Foreign key constraints for the Order table with script

SELECT * FROM "Order" 

ALTER TABLE "Order" 
ADD CONSTRAINT fk_order_buisnessentity  FOREIGN KEY (businessentityid) REFERENCES businessentity(id)


--Homework requirement 6/6
--• List all possible combinations of Customer names and Product names
--that can be ordered from a specific customer

SELECT c.id,  c.name, p.name FROM "Order" o 
JOIN customer c ON c.id = o.customerid 
JOIN orderdetails od ON od.orderid = o.id 
JOIN product p ON p.id = od.id 
ORDER BY c.id

SELECT * FROM "Order" o

SELECT * FROM "Order" o 
JOIN customer c ON c.id = o.customerid 
JOIN orderdetails od ON od.orderid = o.id 

SELECT * FROM orderdetails o 
 

--• List all Business Entities that has any order

SELECT DISTINCT b.id, b.name  FROM businessentity b 
JOIN "Order" o ON o.businessentityid = b.id

--• List all Business Entities without orders
SELECT DISTINCT b.id , b.name FROM businessentity b 
RIGHT JOIN "Order" o ON o.businessentityid = b.id
ORDER BY b.id DESC


SELECT * FROM "Order" o 

--• List all Customers without orders (using Right Join and using Left join)
SELECT * FROM "Order" o 
LEFT JOIN customer c ON o.customerid = c.id
ORDER BY c.id
--WHERE o.customerid IS NULL

SELECT * FROM customer c
RIGHT JOIN "Order"  o ON o.customerid = c.id
ORDER BY c.id



