CREATE TABLE Orders(
UsersID int,
OrdersID int,
EndDate datetime
PRIMARY KEY(OrdersID)
FOREIGN KEY UsersID REFERENCES Users(UsersID)
ON DELETE CASCADE
ON UPDATE CASCADE
);

CREATE TABLE CommentsOnComments(
CommenterID int,
ComenteeID int
PRIMARY KEY(CommenterID)
);


