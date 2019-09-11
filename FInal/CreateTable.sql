
GO
CREATE TABLE Employee
(ID int not null,
Name varchar(100) not null,
Salary real,
Primary Key (ID)
);
GO
CREATE TABLE Users
(UsersID int not null,
Name varchar(100) not null,
Primary Key(UsersID)
);
GO
CREATE TABLE Shops
(Name varchar(100) not null,
Primary Key (Name)
);
GO
CREATE TABLE Products
(Name varchar(100) not null,
Maker varchar(100) not null,
Category varchar(100) not null,
Primary Key (Name)
);
GO
CREATE TABLE Complaint
(ID int not null primary key,
Status varchar(20) not null,
Text text not null,
FillingDateTime datetime not null,
UserID int not null,
EmployeeID int,
AddressedDateTime datetime,
foreign key (EmployeeID) references Employee (ID)
On delete cascade
On update cascade,
foreign key (UserID) references Users(UsersID)
On delete cascade
On update cascade,
);
GO
CREATE TABLE Comments
(UsersID int not null,
CommentsID int not null,
Text text not null,
Primary Key (CommentsID),
Foreign Key (UsersID) references Users(UsersID)
On delete cascade
On update cascade,
);
GO
CREATE TABLE ComplaintsOnComments
(ComplaintsID int not null,
CommentsID int not null,
Primary Key(ComplaintsID),
foreign key (CommentsID) references Comments(CommentsID)
On delete cascade
On update cascade,
);
GO
CREATE TABLE ComplaintsOnShops
(ComplaintsID int not null,
ShopsName varchar(100) not null,
Primary Key(ComplaintsID),
foreign key(ShopsName) references Shops(Name)
On delete cascade
On update cascade,
);

GO
CREATE TABLE ComplaintsOnProducts
(ComplaintsID int not null,
ProductName varchar(100) not null,
Primary Key(ComplaintsID),
foreign key(ProductName) references Products(Name)
On delete cascade
On update cascade,
);

GO
CREATE TABLE Orders(
UsersID int not null,
OrdersID int not null,
EndDate datetime not null,
PRIMARY KEY(OrdersID),
FOREIGN KEY (UsersID) REFERENCES Users(UsersID)
ON DELETE CASCADE
ON UPDATE CASCADE,
);
GO
CREATE TABLE CommentsOnComments(
CommenterID int,
ComenteeID int,
PRIMARY KEY(CommenterID)
);

GO
CREATE TABLE CommentsOnProducts
(CommentsID int not null,
OrdersID int not null,
ShopsName varchar(50),
ProductsName varchar(50),
Primary Key (CommentsID),
Foreign Key (CommentsID) references Comments(CommentsID)
On delete cascade
On update cascade,
);
GO


CREATE TABLE PriceHistory
(StartDate datetime not null,
ShopName varchar(100) not null,
ProductName varchar(100) not null,
Price real not null CHECK(Price>0),
EndDate datetime,
foreign key (ShopName) references Shops (Name)
On delete cascade
On update cascade,
foreign key (ProductName) references Products (Name)
On delete cascade
On update cascade,
Primary Key (ShopName, ProductName, StartDate)
);
GO
CREATE TABLE ProductsInShops
(ShopName varchar(100) not null,
ProductName varchar(100) not null,
Price real not null CHECK(Price>0),
Stock int not null CHECK(Stock>=0),
primary key(ShopName,ProductName),
foreign key (ShopName) references Shops (Name)
On delete cascade
On update cascade,
foreign key (ProductName) references Products (Name)
On delete cascade
On update cascade,
);
GO

CREATE TABLE ProductsInOrders
(ShopName varchar(100) not null,
ProductName varchar(100) not null,
OrderId int not null,
CommentId int,
UserId int not null,
DateTimeRating datetime,
Rating int,
DeliveryDate datetime,
OrderStatus varchar(100),
foreign key (ShopName) references Shops (Name)
On delete cascade
On update cascade,
foreign key (ProductName) references Products (Name)
On delete cascade
On update cascade,
foreign key (OrderId) references Orders (OrdersID)
On delete cascade
On update cascade,
foreign key (UserId) references Users (UsersID)
On delete cascade
On update cascade,
);

