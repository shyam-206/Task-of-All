-- Create Customers table
create table customers_a3 (
    CustomerID int primary key identity(1,1),
    CustomerName varchar(100),
    CustomerAddress varchar(255)
);

-- Create Products table
create table products_a3 (
    ProductID int primary key identity(11,1),
    ProductName varchar(100),
    ProductPrice decimal(10, 2)
);
 
 -- Create Orders table
create table orders_a3 (
    OrderID int primary key identity(101,1) ,
    CustomerID int,
	ProductID int,
    OrderDate date,
	Quantity int,
    TotalAmount decimal(10, 2),
	PaidAmount decimal(10, 2),
    foreign key(CustomerID) references customers_a3(CustomerID),
	foreign key(ProductID) references products_a3(ProductID)
);

drop table orders_a3
-- Insert data into Customers table
INSERT INTO customers_a3 VALUES
    ('Ravi Patel', '12 Gandhi Road'),
    ('Priya Sharma', '34 Nehru Street'),
    ('Rahul Singh', '56 Patel Nagar'),
    ('Anjali Gupta', '78 Rajaji Avenue'),
    ('Amit Kumar', '90 Bose Lane'),
    ('Deepika Mishra', '23 Gandhi Road'),
    ('Vivek Tiwari', '45 Nehru Street'),
    ('Pooja Verma', '67 Patel Nagar'),
    ('Sandeep Singh', '89 Rajaji Avenue'),
    ('Kritika Jain', '12 Gandhi Road'),
    ('Rajesh Gupta', '34 Nehru Street'),
    ('Ananya Sharma', '56 Patel Nagar'),
    ('Alok Kumar', '78 Rajaji Avenue'),
    ('Divya Mishra', '90 Bose Lane'),
    ('Vikas Tiwari', '23 Gandhi Road'),
    ('Sunita Verma', '45 Nehru Street'),
    ('Rahul Singh', '67 Patel Nagar'),
    ('Meenakshi Jain', '89 Rajaji Avenue'),
    ('Sanjay Patel', '12 Gandhi Road'),
    ('Anjali Sharma', '34 Nehru Street');

 
-- Insert data into Products table 
INSERT INTO products_a3  VALUES 
('Saree', 2500.00),
('Kurta', 1299.50),
('Sherwani', 3575.75),
('Sari', 1200.00),
('Lehenga', 4525.25),
('Jhumka', 999.00),
('Bangles', 287.50),
('Kurta-Pajama', 1500.00),
('Dupatta', 505.50),
('Anarkali Suit', 2275.75),
('Salwar Kameez', 4000.00),
('Bindi', 82.25),
('Choli', 600.00),
('Mangalsutra', 3250.50),
('Dhoti', 552.25),
('Pagdi', 189.99),
('Kolhapuri Chappal', 487.75),
('Patola Saree', 14000.00),
('Pashmina Shawl', 6550.50),
('Bhagalpuri Silk Saree', 2775.75);
 

 -- Insert data into Orders table
INSERT INTO orders_a3  VALUES   
(1, 11, '2024-03-14', 2, 5000.00, 4800.00),
(2, 13, '2024-03-14', 1, 3575.75, 3575.75),
(3, 11, '2024-03-13', 3, 6000.00, 6500.00),
(1, 12, '2024-03-13', 2, 2400.00, 2400.00),
(2, 15, '2024-03-12', 1, 6550.50, 6550.50),
(4, 16, '2024-03-12', 2, 1998.00, 2000.00),
(5, 17, '2024-03-11', 1, 552.25, 552.25),
(6, 18, '2024-03-11', 3, 1709.91, 1709.91),
(7, 19, '2024-03-10', 2, 590.00, 590.00),
(5, 20, '2024-03-10', 1, 2775.75, 2775.75),
(1, 21, '2024-03-09', 4, 16000.00, 16000.00),
(2, 22, '2024-03-09', 1, 6550.50, 7000.50),
(6, 23, '2024-03-08', 2, 9500.00, 9500.00),
(8, 24, '2024-03-08', 1, 287.50, 287.50),
(8, 25, '2024-03-07', 3, 8300.25, 8000.25),
(10, 11, '2024-03-07', 2, 5000.00, 5000.00),
(9, 27, '2024-03-06', 1, 14000.00, 14000.00),
(8, 28, '2024-03-06', 3, 1965.75, 1965.75),
(2, 11, '2024-03-05', 3, 7500, 7500),
(1, 30, '2024-03-05', 1, 487.75, 487.75);




-- 1.Create a stored procedure called "get_customers" that returns all customers from the "customers" table.
create proc get_customers 
as 
begin 
    select * from customers_a3
end

exec get_customers
-- 2.Create a stored procedure called "get_orders" that returns all orders from the "orders" table.
create proc get_orders
as 
begin
    select * from orders_a3
end

exec get_orders

-- 3.Create a stored procedure called "get_order_details" that accepts an order ID as a parameter and returns the details of that order (i.e., the products and quantities).
create proc get_order_details 
(@OrderID int)
as 
begin
    select ProductName,Quantity from orders_a3 inner join products_a3 on orders_a3.ProductID = products_a3.ProductID where orders_a3.OrderID = @OrderID
end

exec get_order_details @OrderID = 105
-- 4.Create a stored procedure called "get_customer_orders" that accepts a customer ID as a parameter and returns all orders for that customer.
create proc get_customer_orders @CustomerID int
as
begin
	select * from orders_a3 where CustomerID = @CustomerID
end 

exec get_customer_orders @CustomerID = 5

-- 5.Create a stored procedure called "get_order_total" that accepts an order ID as a parameter and returns the total amount of the order.
create proc get_order_total @OrderID int
as 
begin
	select TotalAmount from orders_a3 where OrderID = @OrderID
end

exec get_order_total  @OrderID = 104

-- 6.Create a stored procedure called "get_product_list" that returns a list of all products from the "products" table.
create proc get_product_list 
as
begin
	select ProductName from products_a3
end

exec get_product_list

-- 7.Create a stored procedure called "get_product_info" that accepts a product ID as a parameter and returns the details of that product.
create proc get_product_info @ProductID int
as
begin
	select * from products_a3 where ProductID = @ProductID
end

exec get_product_info @ProductID = 14
-- 8.Create a stored procedure called "get_customer_info" that accepts a customer ID as a parameter and returns the details of that customer.
create proc get_customer_info @CustomerID int
as
begin
	select * from customers_a3 where CustomerID = @CustomerID
end

exec get_customer_info @CustomerID = 4


-- 9.Create a stored procedure called "update_customer_info" that accepts a customer ID and new information as parameters and updates the customer's information in the "customers" table.
create proc update_customer_info @CustomerID int ,@CustomerName varchar(100)
as
begin
	update customers_a3 set CustomerName = @CustomerName where CustomerID = @CustomerID
end

exec update_customer_info @CustomerID = 4, @CustomerName = 'Shilpa Gupta'
--select * from customers_a3 where CustomerID = 4

-- 10.Create a stored procedure called "delete_customer" that accepts a customer ID as a parameter and deletes that customer from the "customers" table.
create proc delete_customer @CustomerID int 
as
begin
	delete from Customers_a3 where CustomerID = @CustomerID
end 

exec delete_customer @CustomerID = 4 

-- 11.Create a stored procedure called "get_order_count" that accepts a customer ID as a parameter and returns the number of orders for that customer.
alter PROC get_order_count @CustomerID INT
AS
BEGIN
    SELECT COUNT(*) AS order_count
    FROM orders_a3
    WHERE CustomerID = @CustomerID;
END

exec get_order_count @CustomerID = 6

-- 12.Create a stored procedure called "get_customer_balance" that accepts a customer ID as a parameter and returns the customer's balance (i.e., the total amount of all orders minus the total amount of all payments).
create proc get_customer_balance 
	@customerID int
as 
begin
	select (sum(TotalAmount)-sum(PaidAmount)) as Balance from orders_a3 group by CustomerID having CustomerID = @customerID
end
 
exec get_customer_balance @customerID = 1

-- 13.Create a stored procedure called "get_customer_payments" that accepts a customer ID as a parameter and returns all payments made by that customer.
create proc get_customer_payments @CustomerID int
as
begin
	select CustomerID,PaidAmount from orders_a3 where CustomerID = @CustomerID
end


exec get_customer_payments @CustomerID = 4

-- 14.Create a stored procedure called "add_customer" that accepts a name and address as parameters and adds a new customer to the "customers" table.
create proc add_customer @CustomerName varchar(100) , @CustomerAddress varchar(255)
as
begin
	insert into customers_a3 values (@CustomerName, @CustomerAddress)
end

exec add_customer @CustomerName = 'Vivek Gupta' , @CustomerAddress = '455 Nehru Street'

-- 15.Create a stored procedure called "get_top_products" that returns the top 10 products based on sales volume.
create proc	get_top_products 
as
begin
	select top(10) products_a3.ProductID,ProductName,Quantity from products_a3 inner join orders_a3 on products_a3.ProductID = orders_a3.ProductID
end

exec get_top_products
-- 16.Create a stored procedure called "get_product_sales" that accepts a product ID as a parameter and returns the total sales volume for that product.
create proc get_product_sales @ProductID int
as
begin
	select sum(Quantity) as TotalSales,ProductID
	from orders_a3 group by ProductID having ProductID =@ProductID
end

exec get_product_sales 12
-- 17.Create a stored procedure called "get_customer_orders_by_date" that accepts a customer ID and date range as parameters and returns all orders for that customer within the specified date range.
create proc get_customer_orders_by_date @CustomerID int ,@start_date date,@end_date date
as 
begin
select * from orders_a3
where CustomerID = @CustomerID and OrderDate between @start_date and @end_date order by OrderDate
end
exec get_customer_orders_by_date 1,'2024-03-11','2024-03-14'


-- 18.Create a stored procedure called "get_order_details_by_date" that accepts an order ID and date range as parameters and returns the details of that order within the specified date range.
create proc get_order_details_by_date @OrderID int ,@start_date date,@end_date date
as 
begin
select * from orders_a3
where OrderID = @OrderID and OrderDate between @start_date and @end_date
end

exec get_order_details_by_date 103,'2010-03-11','2024-03-13'

-- 19.Create a stored procedure called "get_product_sales_by_date" that accepts a product ID and date range as parameters and returns the total sales volume for that product within the specified date range.

create proc get_product_sales_by_date @ProductID int,@start_date date,@end_date date
as
begin
	select *
	from orders_a3 where ProductID = @ProductID and OrderDate between @start_date and @end_date order by OrderDate
end


exec get_product_sales_by_date 12,'2010-03-11','2024-03-13'
-- 20.Create a stored procedure called "get_customer_balance_by_date" that accepts a customer ID and date range as parameters and returns the customer's balance within the specified date range.

create proc get_customer_balance_by_date @CustomerID int ,@start_date date,@end_date date
as 
begin
select OrderID,CustomerID,TotalAmount,OrderDate from orders_a3
where CustomerID = @CustomerID and OrderDate between @start_date and @end_date order by OrderDate
end
exec get_customer_balance_by_date 1,'2024-03-11','2024-03-14'

-- 21.Create a stored procedure called "add_order" that accepts a customer ID, order date, and total amount as parameters and adds a new order to the "orders" table
create proc add_order 
	@CustomerID int,
	@ProductID int,
	@OrderDate date,
	@Quantity int,
	@TotalAmount decimal(10, 2)
as
begin
	insert into orders_a3 values 
	(@CustomerID,@ProductID,@OrderDate,@Quantity,@TotalAmount,4000)
 end 
 
 exec add_order 3,22,'2024-03-18',15,5000.00 --121
 exec add_order 4,22,'2024-03-18',15,5000.00 --122
-- 22.Create a stored procedure called "update_order_total" that accepts an order ID and a new total amount as parameters and updates the total amount of the order in the "orders" table.
create proc update_order_total
	@OrderID int,
	@TotalAmount decimal(10,2)
as
begin
	update orders_a3 set TotalAmount = @TotalAmount where OrderID = @OrderID
end

exec update_order_total 121,6000.00
-- 23.Create a stored procedure called "delete_order" that accepts an order ID as a parameter and deletes that order from the "orders" table.
create proc delete_order @orderID int
as
begin
	delete from orders_a3 where OrderID = @orderID 
end;
exec delete_order @orderID = 122 -- 122 delete 

