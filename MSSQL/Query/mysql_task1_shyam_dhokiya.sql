use shyam
--CREATED EMP_DETAILS TABLE
create table emp_details(
	EMP_IDNO int primary key,
	EMP_FNAME varchar(50) not null,
	EMP_LNAME varchar(50) not null,
	EMP_DEPT tinyint,
	foreign key (EMP_DEPT) references emp_department(DEP_CODE)
) 
--CREATE THE EMP_DEPARTMENT
create table emp_department(
	DEP_CODE tinyint primary key,
	DEP_NAME varchar(50) not null,
	DEP_ALLOTMENT int,
)

--add row of above table
insert into emp_details values
(526689, 'Carlos', 'Snares', 63),
(843795, 'Enric', 'Dosio', 57),
(328717, 'Jhon', 'Snares', 63),
(444527, 'Joseph', 'Dosni', 47),
(659831, 'Zanifer', 'Emily', 47),
(847674, 'Kuleswar', 'Sitaraman', 57),
(748681, 'Henrey', 'Gabriel', 47),
(555935, 'Alex', 'Manuel', 57),
(539569, 'George', 'Mardy', 27),
(733843, 'Mario', 'Saule', 63),
(631548, 'Alan', 'Snappy', 27),
(839139, 'Maria', 'Foster', 57);
insert into emp_department values
(57, 'IT', 65000),
(63, 'Finance', 15000),
(47, 'HR', 240000),
(27, 'RD', 55000),
(89, 'QC', 75000);

select * from emp_details
select * from emp_department
-- CREATE THE COMPANT_MST
CREATE TABLE COMPANY_MAST (
	COM_ID TINYINT PRIMARY KEY,
	COM_NAME VARCHAR(100) NOT NULL
)
--CREATE THE ITEM_MAST 
CREATE TABLE ITEM_MAST (
	PRO_ID TINYINT PRIMARY KEY,
	PRO_NAME VARCHAR(100) NOT NULL,
	PRO_PRICE INT NOT NULL,
	PRO_COMPANY TINYINT,
	FOREIGN KEY(PRO_COMPANY) REFERENCES COMPANY_MAST(COM_ID)
)


--add data
insert into company_mast values
(11, 'Samsung'),
(12, 'iBall'),
(13, 'Epsion'),
(14, 'Zebronics'),
(15, 'Asus'),
(16, 'Frontech');

insert into item_mast values
(101, 'Mother Board', 3200, 15),
(102, 'Key Board', 450, 16),
(103, 'ZIP drive', 250, 14),
(104, 'Speaker', 550, 16),
(105, 'Monitor', 5000, 11),
(106, 'DVD drive', 900, 12),
(107, 'CD drive', 800, 12),
(108, 'Printer', 2600, 13),
(109, 'Refill cartridge', 350, 13),
(110, 'Mouse', 250, 12);
--SHOW tables
SELECT * FROM COMPANY_MAST
SELECT * FROM ITEM_MAST

--CREATE THE SALESMAN TABLE
create table salesman (
	salesman_id int primary key,
	name varchar(100) not null,
	city varchar(100) not null,
	commission float not null
)

--CREATE THE CUSTOMER TABLE
create table customer (
	customer_id int primary key ,
	cust_name varchar(100) not null,
	city varchar(100) not null,
	grade tinyint,
	salesman_id int,
	foreign key (salesman_id) references salesman(salesman_id)
)

alter table customer alter column grade int null
--CREATE THE ORDER TABLE 
create table orders (
	order_no int primary key,
	purch_amt float not null,
	ord_date date not null,
	customer_id int,
	salesman_id int,
	foreign key (customer_id) references customer(customer_id),
	foreign key (salesman_id) references salesman(salesman_id)
)

--add row data
insert into salesman values
(5001, 'James Hoog', 'New York', 0.15),
(5002, 'Nail Knite', 'Paris', 0.13),
(5005, 'Pit Alex', 'London', 0.11),
(5006, 'Mc Lyon', 'Paris', 0.14),
(5007, 'Paul Adam', 'Rome', 0.13),
(5003, 'Lauson Hen', 'San Jose', 0.12);
insert into customer values
(3002, 'Nick Rimando', 'New York', 100, 5001),
(3007, 'Brad Davis', 'New York', 200, 5001),
(3005, 'Graham Zusi', 'California', 200, 5002),
(3008, 'Julian Green', 'London', 300, 5002),
(3004, 'Fabian Johnson', 'Paris', 300, 5006),
(3009, 'Geoff Cameron', 'Berlin', 100, 5003),
(3003, 'Jozy Altidor', 'Moscow', 200, 5007),
(3001, 'Brad Guzan', 'London', NULL, 5005);
insert into orders values
(70001, 150.5, '2012-10-05', 3005, 5002),
(70009, 270.65, '2012-09-10', 3001, 5005),
(70002, 65.26, '2012-10-05', 3002, 5001),
(70004, 110.5, '2012-08-17', 3009, 5003),
(70007, 948.5, '2012-09-10', 3005, 5002),
(70005, 2400.6, '2012-07-27', 3007, 5001),
(70008, 5760, '2012-09-10', 3002, 5001),
(70010, 1983.43, '2012-10-10', 3004, 5006),
(70003, 2480.4, '2012-10-10', 3009, 5003),
(70012, 250.45, '2012-06-27', 3008, 5002),
(70011, 75.29, '2012-08-17', 3003, 5007),
(70013, 3045.6, '2012-04-25', 3002, 5001);
 
--SHOW DATABASE
SELECT * FROM customer
SELECT * FROM salesman;
SELECT * FROM orders;


--All query questions


-- (1) Write a SQL statement to find the total purchase amount of all orders.
select sum(purch_amt) as total_amt from orders 
--	17541.18

-- (2) Write a SQL statement to find the average purchase amount of all orders.
select avg(purch_amt) as avg_purchase_amount from orders
--1461.765

-- (3) Write a SQL statement to find the number of salesmen currently listing for all of their customers
select count(distinct salesman_id) as total_salesman_number from customer
-- 6

-- (4) Write a SQL statement to know how many customer have listed their names.
select count(cust_name) as total_customer_name from customer 
-- 8

-- (5) Write a SQL statement find the number of customers who gets at least a gradation for his/her performance
select count(grade) from customer
--7

-- (6) Write a SQL statement to get the maximum purchase amount of all the orders
select max(purch_amt) as maximum_purchase_amount from orders
-- 5760

-- (7) Write a SQL statement to get the minimum purchase amount of all the orders
select min(purch_amt) as minimum_purchase_amount from orders
-- 65.26

-- (8) Write a SQL statement which selects the highest grade for each of the cities of the customers.   
select max(grade),city from customer GROUP by city
-- 100	Berlin
-- 200	California
-- 300	London
-- 200	Moscow
-- 200	New York
-- 300	Paris

-- (9) Write a SQL statement to find the highest purchase amount ordered by the each customer with their ID and highest purchase amount.  
select customer_id,max(purch_amt) as highest_purchase_amount from orders group by customer_id
-- 3001	270.65
-- 3002	5760
-- 3003	75.29
-- 3004	1983.43
-- 3005	948.5
-- 3007	2400.6
-- 3008	250.45
-- 3009	2480.4


-- (10) Write a SQL statement to find the highest purchase amount ordered by the each customer on a particular date with their ID, order date and highest purchase amount. 
select max(purch_amt) as highest_purchase_amount, customer_id,ord_date from orders group by customer_id,ord_date

-- (11) Write a SQL statement to find the highest purchase amount on a date '2012-08-17' for each salesman with their ID.
select max(purch_amt) as highest_purchase_amount, salesman_id from orders where ord_date = '2012-08-17' group by salesman_id
-- 110.5	5003
-- 75.29	5007

-- (12) Write a SQL statement to find the highest purchase amount with their ID and order date, for only those customers who have highest purchase amount in a day is more than 2000.  
select  max(purch_amt) as highest_purchase_amount,customer_id,ord_date from orders group by customer_id,ord_date having max(purch_amt) > 2000
-- 3045.6	3002	2012-04-25
-- 2400.6	3007	2012-07-27
-- 5760		3002	2012-09-10
-- 2480.4	3009	2012-10-10

-- (13) Write a SQL statement to find the highest purchase amount with their ID and order date, for those customers who have a higher purchase amount in a day is within the range 2000 and 6000
select  max(purch_amt) as highest_purchase_amount,customer_id,ord_date from orders group by customer_id,ord_date having max(purch_amt) between 2000 and 6000
-- 3045.6	3002	2012-04-25
-- 2400.6	3007	2012-07-27
-- 5760		3002	2012-09-10
-- 2480.4	3009	2012-10-10

-- (14) Write a SQL statement to find the highest purchase amount with their ID and order date, for only those customers who have a higher purchase amount in a day is within the list 2000, 3000, 5760 and 6000.  
select  max(purch_amt) as highest_purchase_amount,customer_id,ord_date from orders where purch_amt in (2000,6000,5760,6000) group by customer_id,ord_date
-- 5760	3002	2012-09-10

-- (15) Write a SQL statement to find the highest purchase amount with their ID, for only those customers whose ID is within the range 3002 and 3007.
select  max(purch_amt) as highest_purchase_amount,customer_id from orders group by customer_id having customer_id between 3002 AND 3007
-- 5760		3002
-- 75.29	3003
-- 1983.43	3004
-- 948.5	3005
-- 2400.6	3007

-- (16) Write a SQL statement to display customer details (ID and purchase amount) whose IDs are within the range 3002 and 3007 and highest purchase amount is more than 1000.  
select  max(purch_amt) as highest_purchase_amount,customer_id from orders WHERE customer_id between 3002 AND 3007 group by customer_id having MAX(purch_amt) > 1000
-- 5760		3002
-- 1983.43	3004
-- 2400.6	3007


-- (17) Write a SQL statement to find the highest purchase amount with their ID, for only those salesmen whose ID is within the range 5003 and 5008. 
select  max(purch_amt) as highest_purchase_amount,salesman_id from orders group by salesman_id having salesman_id between 5003 AND 5008
-- 2480.4	5003
-- 270.65	5005
-- 1983.43	5006
-- 75.29	5007

-- (18) Write a SQL statement that counts all orders for a date August 17th, 2012.  
 select count(order_no) from orders where ord_date = '2012-08-17'
 --2


-- (19) Write a SQL statement that count the number of salesmen for whom a city is specified. Note that there may be spaces or no spaces in the city column if no city is specified.
select city from salesman where city is not null

-- (20) Write a query that counts the number of salesmen with their order date and ID registering orders for each day.
select count(salesman_id) ,ord_date ,salesman_id from orders  group by ord_date,salesman_id

-- (21) Write a SQL query to calculate the average price of all the products. 
select avg(pro_price) as avg_price from ITEM_MAST
-- 1435

-- (22) Write a SQL query to find the number of products with a price more than or equal to Rs.350.
select count(PRO_ID) from ITEM_MAST where pro_price >= 350 --8

-- (23) Write a SQL query to display the average price of each company's products, along with their code.
select avg(pro_price) as avg_price , PRO_COMPANY from item_mast group by PRO_COMPANY
-- 5000	11
-- 650	12
-- 1475	13
-- 250	14
-- 3200	15
-- 500	16

-- (24) Write a query in SQL to find the sum of the allotment amount of all departments. 
select sum(DEP_ALLOTMENT) as sum_DEP_ALLOTMENT from emp_department

-- (25) Write a query in SQL to find the number of employees in each department along with the department code.
select count(EMP_IDNO) ,EMP_DEPT from emp_details group by EMP_DEPT
-- 2	27
-- 3	47
-- 4	57
-- 3	63