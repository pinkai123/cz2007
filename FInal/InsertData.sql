

/* General

Insert into Shops
(Name)
Values('A'),('B'),('C'),('D'),('E'),('F');
Insert into Products
(Name, Maker, Category)
Values('iPhoneX','Apple','IT'),('S9','Samsung','IT'),('V40','LG','IT'),('S8','Samsung','IT'),('S7','Samsung','IT'),('S6','Samsung','IT');
Insert into Users
(UsersID, Name)
Values(1,'Alan'),(2,'John'),(3,'Hanks'),(4,'Horn');

*/

/* for query 1

Insert into PriceHistory
(StartDate,ShopName,ProductName, Price,EndDate)
Values('2018-07-29',(select Name From Shops Where Name = 'C'),(select Name From Products Where Name = 'iPhoneX'),800,'2018-07-30'),
('2018-07-30',(select Name From Shops Where Name = 'C'),(select Name From Products Where Name = 'iPhoneX'),850,'2018-08-09'),
('2018-08-09',(select Name From Shops Where Name = 'C'),(select Name From Products Where Name = 'iPhoneX'),900,'2018-08-15'),
('2018-08-15',(select Name From Shops Where Name = 'C'),(select Name From Products Where Name = 'iPhoneX'),810,'2018-09-02'),
('2018-09-02',(select Name From Shops Where Name = 'C'),(select Name From Products Where Name = 'iPhoneX'),860,'2018-09-15');

*/

/* for query 2 & 3

Declare @Counter INT
Set @Counter = 0
WHILE @Counter < 50
BEGIN
Insert into ProductsInOrders
(ShopName, ProductName, OrderId, CommentId,UserId,DateTimeRating, Rating,DeliveryDate,OrderStatus)
Values((select Name From Shops Where Name = 'B'),(select Name From Products Where Name = 'iPhoneX'),(select OrdersID from Orders where OrdersID = '1'),@counter*3, (select UsersID From Users Where UsersID = '1'), '2018-08-02','5','2018-07-25','Delivered');
SET @Counter += 1
END

Set @Counter = 0
WHILE @Counter < 100
BEGIN
Insert into ProductsInOrders
(ShopName, ProductName, OrderId, CommentId,UserId,DateTimeRating, Rating,DeliveryDate,OrderStatus)
Values((select Name From Shops Where Name = 'A'),(select Name From Products Where Name = 'iPhoneX'),(select OrdersID from Orders where OrdersID = '2'),@counter*3, (select UsersID From Users Where UsersID = '2'), '2018-08-02','5','2018-07-26','Delivered');
SET @Counter += 1
END

Set @Counter = 0
WHILE @Counter <= 100
BEGIN
Insert into ProductsInOrders
(ShopName, ProductName, OrderId, CommentId,UserId,DateTimeRating, Rating,DeliveryDate,OrderStatus)
Values((select Name From Shops Where Name = 'B'),(select Name From Products Where Name = 'S9'),(select OrdersID from Orders where OrdersID = '3'),@counter*3, (select UsersID From Users Where UsersID = '3'), '2018-08-02','5','2018-07-27','Delivered');
SET @Counter += 1
END


Set @Counter = 0
WHILE @Counter <= 64
BEGIN
Insert into ProductsInOrders
(ShopName, ProductName, OrderId, CommentId,UserId,DateTimeRating, Rating,DeliveryDate,OrderStatus)
Values((select Name From Shops Where Name = 'C'),(select Name From Products Where Name = 'V40'),(select OrdersID from Orders where OrdersID = '4'),@counter*3, (select UsersID From Users Where UsersID = '4'), '2018-08-03','5','2018-07-28','Delivered');
SET @Counter += 1
END
*/

/*for query 3

Insert into Orders
(UsersID,OrdersID,EndDate)
Values((select UsersID From Users Where UsersID = '1'), '1','2018-07-02'),
		((select UsersID From Users Where UsersID = '2'), '2','2018-07-07'),
		((select UsersID From Users Where UsersID = '3'), '3','2018-07-10'),
		((select UsersID From Users Where UsersID = '4'), '4','2018-07-13');
*/


/* for Query 4
Insert into Employee
Values('1','Thomson','1200'),('2','Gone','1000');

Insert into Complaint
(ID,Status,Text,FillingDateTime,UserID,EmployeeID,AddressedDateTime)
Values('1','Handled','omg','2018-07-25','1',(select ID from Employee where ID = '1'),'2018-08-19'),
		('2','Handled','omg','2018-07-25','2',(select ID from Employee where ID = '1'),'2018-08-20'),
		('3','Handled','omg','2018-07-25','3',(select ID from Employee where ID = '2'),'2018-08-21'),
		('4','Handled','omg','2018-07-25','4',(select ID from Employee where ID = '2'),'2018-08-22');

*/

/* for query 5, need to change ProductName value for each shop so as each shop selling differnet number of samsung products

Insert into ProductsInShops
(ShopName, ProductName,Price,Stock)
Values((select Name From Shops Where Name = 'A'),(select Name From Products where Name = 'V40'),1600, 30);
Insert into ProductsInShops
(ShopName, ProductName,Price,Stock)
Values((select Name From Shops Where Name = 'B'),(select Name From Products where Name = 'iPhoneX'),1100, 30);
Insert into ProductsInShops
(ShopName, ProductName,Price,Stock)
Values((select Name From Shops Where Name = 'C'),(select Name From Products where Name = 'iPhoneX'),1200, 30);
Insert into ProductsInShops
(ShopName, ProductName,Price,Stock)
Values((select Name From Shops Where Name = 'D'),(select Name From Products where Name = 'S6'),1400, 30),
((select Name From Shops Where Name = 'E'),(select Name From Products where Name = 'S6'),900, 30),
((select Name From Shops Where Name = 'F'),(select Name From Products where Name = 'S6'),1000, 30);
*/
