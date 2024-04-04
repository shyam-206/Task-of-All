CREATE TABLE Employees(
    EmployeeID int identity(1,1) primary key,
    LastName varchar(50),
    FirstName varchar(50),
    Title varchar(50),
    BirthDate date,
    HireDate date,
    ReportsTo int,
    Address varchar(100)
);
 
CREATE TABLE Customers (
    CustomerID int identity(1,1) primary key,
    CompanyName varchar(100),
    ContactName varchar(50),
    ContactTitle varchar(50),
    Address varchar(100),
    City varchar(50),
    Country varchar(50)
);
 
 
CREATE TABLE Orders_table (
    OrderID int identity(1,1) primary key,
    CustomerID int,
    EmployeeID int,
    OrderDate date,
    foreign key (EmployeeID) references Employees(EmployeeID),
	foreign key (CustomerID) references Customers(CustomerID)
);
 

 
 
INSERT INTO Employees VALUES
    ('Doe', 'John', 'Manager', '1980-05-15', '2005-10-20', NULL, '123 Main St, Anytown, USA'),
    ('Johnson', 'Robert', 'Customer Service Representative', '1990-07-10', '2012-08-05', 1, '789 Oak St, Anycity, USA'),
    ('Williams', 'Emily', 'Sales Associate', '1987-03-25', '2010-09-18', 1, '321 Maple St, Newtown, USA'),
    ('Brown', 'Michael', 'Customer Service Representative', '1992-11-12', '2014-07-03', 2, '654 Pine St, Othercity, USA'),
    ('Anderson', 'Jessica', 'Sales Manager', '1983-08-07', '2007-02-28', 1, '987 Cedar St, Anycity, USA'),
    ('Garcia', 'Daniel', 'Marketing Coordinator', '1989-05-19', '2015-11-22', 3, '741 Oakwood Dr, Othertown, USA'),
    ('Smith', 'Jane', 'Sales Manager', '1985-09-20', '2008-03-12', 1, '456 Elm St, Othertown, USA'),
    ('Martinez', 'Sophia', 'HR', '1980-12-03', '2005-04-15', 6, '369 Birch St, Megatown, USA');
 
INSERT INTO Customers VALUES
    ('ABC Inc.', 'Alice Smith', 'CEO', '123 Business Rd, Smalltown', 'Smalltown', 'USA'),
    ('XYZ Corp.', 'Bob Johnson', 'Manager', '456 Corporate Ave, Cityville', 'Cityville', 'USA'),
    ('LMN Enterprises', 'David Lee', 'Director', '101 Industry Lane, Metrocity', 'Metrocity', 'UK'),
    ('PQR Solutions', 'Eleanor Adams', 'Manager', '789 Tech Blvd, Innovation City', 'Innovation City', 'USA'),
    ('RST Industries', 'Franklin Martinez', 'CEO', '321 Manufacturing Rd, Productiontown', 'Productiontown', 'USA'),
    ('UVW Corporation', 'Grace Thompson', 'Director', '555 Commerce Ave, Businesstown', 'Businesstown', 'Canada'),
    ('EFG Ltd.', 'Charlie Brown', 'Owner', '789 Enterprise Blvd, Megacity', 'Megacity', 'Canada'),
    ('STU Enterprises', 'Henry Walker', 'Owner', '222 Trade Blvd, Marketcity', 'Marketcity', 'UK'),
    ('VWX Ltd.', 'Isabella Carter', 'Manager', '999 Service St, Supportville', 'Supportville', 'USA'),
    ('YZ Corporation', 'Jack Evans', 'CEO', '777 Enterprise Blvd, Entreptown', 'Entreptown', 'Canada');
 
 
INSERT INTO Orders_table VALUES 
	(1, 1, '2024-01-10'),
    (2, 2, '2024-02-15'),
    (3, 3, '2024-03-20'),
    (1, 2, '2024-04-25'),
    (2, 1, '2024-05-30'),
    (3, 2, '2024-06-05'),
    (1, 3, '2024-07-10'),
    (2, 1, '2024-08-15'),
    (3, 2, '2024-09-20'),
    (1, 2, '2024-10-25'),
    (2, 3, '2024-11-30'),
    (3, 1, '2024-12-05');

select * from Employees
select * from Customers
select * from Orders_table



-- Write a SQL query to retrieve the list of all orders made by customers in the "USA".
select * from Customers inner join Orders_table on Customers.CustomerID = Orders_table.CustomerID where Customers.Country = 'USA'

-- Write a SQL query to retrieve the list of all customers who have placed an order.
select DISTINCT Customers.CustomerID,Customers.ContactName from Customers inner join Orders_table on Customers.CustomerID = Orders_table.CustomerID where Customers.CustomerID is not null

-- Write a SQL query to retrieve the list of all employees who have not yet placed an order.
select Employees.EmployeeID,Employees.FirstName,Employees.LastName from Employees left join Orders_table on Employees.EmployeeID = Orders_table.EmployeeID where Orders_table.EmployeeID is null

-- Write a SQL query to retrieve the list of all employees who have placed an order.
select DISTINCT Employees.EmployeeID,Employees.FirstName,Employees.LastName from Employees left join Orders_table on Employees.EmployeeID = Orders_table.EmployeeID where Orders_table.EmployeeID is not null

-- Write a SQL query to retrieve the list of all customers who have not yet placed an order.
select Customers.CustomerID,Customers.ContactName from Customers left join Orders_table on Customers.CustomerID = Orders_table.CustomerID where Orders_table.CustomerID is NULL

-- Write a SQL query to retrieve the list of all customers who have placed an order, along with the order date.
select DISTINCT Customers.CustomerID,Customers.ContactName,Orders_table.OrderDate from Customers inner join Orders_table on Customers.CustomerID = Orders_table.CustomerID where Customers.CustomerID is not null 
                       
-- Write a SQL query to retrieve the list of all orders placed by a particular customer.
select DISTINCT Customers.CustomerID,Customers.ContactName from Customers inner join Orders_table on Customers.CustomerID = Orders_table.CustomerID where Customers.CustomerID is not null

-- Write a SQL query to retrieve the list of all orders placed by a particular employee.
select DISTINCT Employees.EmployeeID,Employees.FirstName,Employees.LastName from Employees left join Orders_table on Employees.EmployeeID = Orders_table.EmployeeID where Orders_table.EmployeeID is not  null

-- Write a SQL query to retrieve the list of all orders placed by a particular customer on a particular date.
select DISTINCT Customers.CustomerID,Customers.ContactName,Orders_table.OrderDate from Customers left join Orders_table on Customers.CustomerID = Orders_table.CustomerID where Orders_table.CustomerID is not null 

-- Write a SQL query to retrieve the list of all customers who have not yet placed an order, sorted by their country.
select Customers.CustomerID,Customers.ContactName,Customers.Country from Customers left join Orders_table on Customers.CustomerID = Orders_table.CustomerID where Orders_table.CustomerID is NULL order by Customers.Country asc

-- Write a SQL query to retrieve the list of all orders placed by customers in the "USA", sorted by order date.
select Customers.CustomerID,Customers.Country,Orders_table.OrderDate from Customers inner join Orders_table on Customers.CustomerID = Orders_table.CustomerID where Customers.Country = 'USA' order by Orders_table.OrderDate asc

-- Write a SQL query to retrieve the list of all employees who have not yet placed an order, sorted by last name.
select Employees.EmployeeID,Employees.FirstName,Employees.LastName from Employees left join Orders_table on Employees.EmployeeID = Orders_table.EmployeeID where Orders_table.EmployeeID is null order by Employees.LastName 

-- Write a SQL query to retrieve the list of all customers who have placed an order, sorted by their company name.
select distinct Customers.CustomerID,Customers.ContactName,Customers.CompanyName from Customers inner join Orders_table on Customers.CustomerID = Orders_table.CustomerID where Orders_table.CustomerID is not NULL order by Customers.CompanyName asc

-- Write a SQL query to retrieve the list of all employees who have placed an order, sorted by their hire date.
select DISTINCT Employees.EmployeeID,Employees.FirstName,Employees.LastName ,Employees.HireDate from Employees left join Orders_table on Employees.EmployeeID = Orders_table.EmployeeID where Orders_table.EmployeeID is not null order by Employees.HireDate ASC

-- Write a SQL query to retrieve the list of all customers who have placed an order on a particular date, sorted by their company name.
select Customers.CustomerID,Customers.ContactName,Customers.CompanyName,Orders_table.OrderDate from Customers left join Orders_table on Customers.CustomerID = Orders_table.CustomerID where Orders_table.CustomerID is not NULL ORDER BY Customers.Country asc

-- Write a SQL query to retrieve the list of all customers who have placed an order, along with the employee who handled the order.
select distinct Customers.CustomerID,ContactName,FirstName,LastName from Customers  inner join Orders_table on Orders_table.CustomerID = Customers.CustomerID join Employees on Orders_table.EmployeeID= Employees.EmployeeID

-- Write a SQL query to retrieve the list of all employees who have placed an order, along with the customer who placed the order.
select distinct FirstName,LastName,ContactName,Customers.CustomerID from Customers  inner join Orders_table  on Orders_table.CustomerID = Customers.CustomerID join Employees on Orders_table.EmployeeID= Employees.EmployeeID

-- Write a SQL query to retrieve the list of all orders placed by customers in a particular country, along with the customer name and order date.
select Customers.CustomerID,Customers.ContactName,Customers.Country,Orders_table.OrderDate from Customers inner join Orders_table on Customers.CustomerID = Orders_table.CustomerID where Orders_table.CustomerID is not null

-- Write a SQL query to retrieve the list of all orders placed by employees who were born in a particular year, along with the employee name and order date.
select Employees.EmployeeID,Employees.FirstName,Employees.LastName,Employees.BirthDate,Orders_table.OrderDate from Employees left join Orders_table on Employees.EmployeeID = Orders_table.EmployeeID where Orders_table.EmployeeID is not null order by Employees.BirthDate ASC

-- Write a SQL query to retrieve the list of all customers who have placed an order, along with the customer name, order date, and employee who handled the order.
select Customers.CustomerID,ContactName,FirstName,LastName,Orders_table.OrderDate from Customers inner join Orders_table on Orders_table.CustomerID = Customers.CustomerID join Employees on Orders_table.EmployeeID= Employees.EmployeeID 

-- Write a SQL query to retrieve the list of all orders placed by customers who have a particular contact title, along with the customer name and order date.
select Customers.CustomerID,Customers.CompanyName,Customers.ContactName,Orders_table.OrderDate  from Customers inner join Orders_table on Customers.CustomerID = Orders_table.CustomerID

-- Write a SQL query to retrieve the list of all orders placed by employees who have a particular job title, along with the employee name and order date.
select Employees.EmployeeID,Employees.FirstName,Employees.LastName,Employees.Title,Orders_table.OrderDate from Employees inner join Orders_table on Employees.EmployeeID = Orders_table.EmployeeID 

-- Write a SQL query to retrieve the list of all customers who have placed an order on a particular date, along with the customer name, order date, and employee who handled the order.
select distinct Customers.CustomerID,ContactName,FirstName,LastName,OrderDate from Customers  inner join Orders_table  on Orders_table.CustomerID = Customers.CustomerID join Employees on Orders_table.EmployeeID= Employees.EmployeeID order by OrderDate

-- Write a SQL query to retrieve the list of all orders placed by customers in a particular city, along with the customer name and order date.
select Customers.CustomerID,Customers.ContactName,Customers.City,Orders_table.OrderDate  from Customers inner join Orders_table on Customers.CustomerID = Orders_table.CustomerID order by Customers.City

-- Write a SQL query to retrieve the list of all orders placed by employees who were born in a particular city, along with the employee name and order date.

-- Write a SQL query to retrieve the list of all customers who have placed an order, along with the customer name, order date, and employee who handled the order, sorted by order date.
select Customers.CustomerID,Customers.ContactName,Orders_table.OrderDate,Orders_table.EmployeeID from Customers inner join Orders_table on Customers.CustomerID = Orders_table.CustomerID join Employees on Orders_table.EmployeeID = Employees.EmployeeID order by Orders_table.OrderDate

-- Write a SQL query to retrieve the list of all orders placed by customers in a particular country, along with the customer name and order date, sorted by order date.
select DISTINCT Customers.CustomerID,Customers.ContactName,Customers.Country,Orders_table.OrderDate from Customers inner join Orders_table on Customers.CustomerID = Orders_table.CustomerID order by Orders_table.OrderDate