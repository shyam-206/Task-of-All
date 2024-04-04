create table CetegoryMaster (
CategoryID int primary key identity(1,1),
CategoryName varchar(15) not null,
CategoryDescription varchar(30) not null,
isActive bit not null,
CreatedDate date not null
 
)
 
create table ItemMaster (
ItemId int primary key identity(1,1),
CategoryID int,
Itemname varchar(15) not null,
IteamDescription varchar(30),
Price decimal(10,2) not null,
GST decimal(10,2) not null,
isActive bit not null,
CreatedDate date not null,
 
foreign key (CategoryID) references CetegoryMaster(CategoryID)
 
)

create table CouponMaster (
CouponedID int primary key identity(1,1),
CouponText varchar(15) not null,
DiscountPercentage decimal(10,2) not null,
ExpiryDate date not null
)
 
create table OrderMaster(
OrderId int primary key identity(1,1),
Deliverycharge decimal(10,2) not null,
CouponAmount decimal(10,2) not null,
Subtotal decimal(10,2) not null,
Total decimal(10,2) not null,
OrderDate date not null
)
 
 
create table Orderdetails (
OrderDetailsID int primary key identity(1,1),
OrderId int,
ItemId int not null,
Quantity int not null,
Total decimal(10,2) not null,
foreign key (OrderId) references OrderMaster(OrderId),
foreign key (ItemId) references ItemMaster(ItemId)
)

insert into CetegoryMaster 
(CategoryName,CategoryDescription,isActive,CreatedDate)
values
	--('Electronic','Electronic Description',1,'2024-03-22'),
	--('Book','Book Description',0,'2024-02-21')
	('Comics','Book Description',1,'2024-02-21')

insert into ItemMaster
	(CategoryID,Itemname,IteamDescription,Price,GST,isActive,CreatedDate)
values
	(1,'Watch','Watch Description',1500.99,5,1,'2024-03-22'),
	(1,'Watch 2','Watch Description',1000.99,5,0,'2024-03-24'),
	(1,'Mobile','Mobile Description',2000.99,10,1,'2024-03-23'),
	(2,'Book 1','Book Description',100.99,5,1,'2024-02-24')
	(3,'Manga','Book Description',10.99,5,1,'2024-02-24')

insert into CouponMaster
	(CouponText,DiscountPercentage,ExpiryDate)
values
	('ABC123',5,'2024-05-01'),
	('PQR1',5,'2023-04-30'),
	('PQR23',2,'2024-04-21')
	

create or alter proc item_quantity_couponName
(
	@ItemId int,
	@Quantity int,
	@CouponedID int
)
as
begin
	
	--checked item is present or not
	declare @itemActive bit
	declare @categoryId int,@categotyActive bit
	declare @Subtotal decimal(10,2)
	declare @Total decimal(10,2)
	declare @discount decimal(10,2)
	declare @DeliveryCharge int
	declare @CouponAmount decimal(10,2)
	declare @CouID int
	declare @date date

	select @itemActive = IsActive  from ItemMaster where ItemId = @ItemId
	select @categotyActive = c.isActive from CetegoryMaster c inner join ItemMaster i on c.CategoryID = i.CategoryID where i.ItemId = @ItemId
	select  @CouID = CouponedID from CouponMaster where CouponedID = @CouponedID 
	select @date = ExpiryDate from CouponMaster where CouponedID = @CouponedID
	select @discount = DiscountPercentage from CouponMaster where CouponedID = @CouponedID

	if(@itemActive = 0 )
		begin
			print('item is not avilable')
		end
	else if(@categotyActive = 0 )
		begin
			print('category is not avilable')
		end
	else if(@itemActive = 1 and @categotyActive = 1)
		begin
			--
			set @Subtotal = (dbo.total_amount(@ItemId , @Quantity))

			begin 
				if( @Subtotal > 1000)
					begin
						select @DeliveryCharge = 0
					end
				else if(@Subtotal <= 1000 and @Subtotal >= 500)
					begin
						select @DeliveryCharge = 50
					end
				else 
					begin
						select @DeliveryCharge =  80
					end
			end
			
			select @Total = @Subtotal + @DeliveryCharge
			select @CouponAmount =  @Total * @discount / 100
			begin 
				if  @CouID is not null
					begin
						--print('done coupon')
						if (GETDATE() < @date)
							begin
								select @Total = @Total - @CouponAmount
								
								insert into OrderMaster 
									(Deliverycharge,CouponAmount,Subtotal,Total,OrderDate)
								values
									(@DeliveryCharge,@CouponAmount,@Subtotal,@Total,GETDATE())
								
								declare @OrderID int
								set @OrderID = (select top(1) OrderId from OrderMaster order by OrderId desc)

								insert into OrderDetails 
								(OrderId,ItemId,Quantity,Total)
								values 
								(@OrderID,@ItemId,@Quantity,@Total)

								select * from OrderMaster
								select * from Orderdetails
							end
						else
							begin
								print('expired')
							end

					end
				else	
					begin
						print('not exist')
					end
			end
	
		end
end




exec item_quantity_couponName 5,3,1





--function for the total amount
create function total_amount
(
	@ItemId int,
	@Quantity int
)
returns decimal(10,2)
as
begin
	declare @totalAmount decimal(10,2)
	declare @priceWithGST decimal(10,2)
	select @priceWithGST = (price + (price * GST /100)) from ItemMaster where ItemId = @ItemId

	select @totalAmount = @priceWithGST * @Quantity
	return @totalAmount
end

select dbo.total_amount(1,5) as Subtotal

use shyam
