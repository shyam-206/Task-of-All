declare @purch_amt decimal(10,2),
		--@ord_date date,
		@customer_id int,
		@order_no int,
		@name varchar(50)

declare exa_cursor cursor 
for
	select purch_amt,customer_id,order_no,name from orders inner join salesman on orders.salesman_id = salesman.salesman_id

open exa_cursor

fetch next from exa_cursor into @purch_amt,@customer_id,@order_no,@name

while @@fetch_status = 0
begin
	print 'amount : ' + cast(@purch_amt as varchar)  + ' ' +'customer_id : ' + cast(@customer_id as varchar) + ' ' + 'order_no : ' + cast(@order_no as varchar) + ' ' + 'name : ' + @name
	fetch next from exa_cursor into @purch_amt,@customer_id,@order_no,@name
end

close exa_cursor
deallocate exa_cursor