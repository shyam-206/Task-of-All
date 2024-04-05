use shyam

create table customermaster1
(
	customerId int identity(101,1) primary key,
	customername varchar(50) not null,
	email varchar(50) not null,
	isActive bit not null,
	CreatedDate date not null
)

create table productmaster1
(
	productId int identity(1,1) primary key,
	productname varchar(50) not null,
	productdesc varchar(100),
	price int not null,
	isActive bit not null,
	CreatedDate date not null
)

create table ordermaster1
(
	orderId int identity(1,1) primary key,
	customerId int,
	orderDate date not null,
	totalAmount decimal(10,2) not null,
	isPaid bit not null,
	createdDate date not null
	foreign key (customerId) references customermaster1(customerId)
)

create table orderdetails1
(
	orderdetailId int identity(1,1) primary key,
	orderId int,
	productId int,
	Quantity int not null,
	Total int not null,
	foreign key (orderId) references ordermaster1(orderId),
	foreign key (productId) references productmaster1(productId)
)


insert into customermaster1
(customername,email,isActive,CreatedDate)
values
('customer 1','customer1@gamil.com',1,'2024-03-05'),
('customer 2','customer2@gamil.com',0,'2024-03-06'),
('customer 3','customer3@gamil.com',1,'2024-03-05')

insert into productmaster1
(productname,
productdesc,
price,
isActive,
CreatedDate)
values
('product 1','product 1 desc',100,1,GETDATE()),
('product 2','product 2 desc',100,0,GETDATE()),
('product 3','product 3 desc',100,0,GETDATE()),
('product 4',null,100,1,GETDATE()),
('product 5','product 5 desc',300,1,GETDATE())

create or alter proc add_order
(
	@customerId int,
	@productId int,
	@Quantity int
)
as
begin
	
	declare @product_active bit
	declare @customer_active bit
	declare @total decimal(10,2)
	
	select @product_active = isActive from productmaster1 where productId = @productId
	select @customer_active = isActive from customermaster1 where customerId = @customerId

	if(@product_active = 0)
	begin
		print('product is not available')
	end
	else if(@customer_active = 0)
	begin 
		print('customer is not available')
	end
	else
	begin 
		set @total = (dbo.total_price(@productId,@Quantity))
		--select @total as total

		insert into ordermaster1
			(customerId,orderDate,totalAmount,isPaid,createdDate)
		values
			(@customerId,GETDATE(),@total,1,GETDATE())

		declare @orderId int
		select top 1 @orderId = orderId from ordermaster1 order by orderId desc

		select * from ordermaster1
		
		insert into orderdetails1
			(orderId,productId,Quantity,Total)
		values
			(@orderId,@productId,@Quantity,@total)

		select * from orderdetails1
	end 
end

create function total_price
(
	@productId int,
	@Quantity int
)
returns decimal(10,2)
as
begin
	declare @total decimal(10,2)
	declare @price int
	select @price = price from productmaster1 where productId = @productId
	select @total = @price * @Quantity

	return @total
end

exec add_order 103,5,7