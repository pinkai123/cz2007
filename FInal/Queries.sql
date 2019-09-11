
	/*Q1 Query*/
select ProductName, avg(Price) as average
From PriceHistory
where EndDate >= '2018-08-01' AND StartDate <= '2018-08-31' AND ProductName = 'iPhoneX'
Group by ProductName;

	/*Q2 Query*/
select ProductName
from ProductsInOrders
where Rating = '5' AND DateTimeRating <= '2018-08-31' AND DateTimeRating >= '2018-08-01'
group by ProductName
Having count(*)>= 100;


select *
from Orders;


	/*Q3 Query*/
select ProductName, AVG(DATEDIFF(day,EndDate,DeliveryDate)) as average
from Orders,ProductsInOrders
where month(EndDate)='6' AND year(EndDate) ='2018'AND Orders.OrdersID = ProductsInOrders.OrderId
group by ProductName; 

	/*Q4 Query*/
select Name,AVG(DATEDIFF(day,FillingDateTime,AddressedDateTime)) as Latency
from Complaint, Employee
where Complaint.EmployeeID = Employee.ID
group by Name,EmployeeID
having AVG(DATEDIFF(day,FillingDateTime,AddressedDateTime))<= ALL (select AVG(DATEDIFF(day,FillingDateTime,AddressedDateTime))
																		from Complaint
																		group by EmployeeID);


	/*Q5 Query */
select ProductName, count(ShopName) as numShops
from ProductsInShops, Products
where Maker = 'Samsung' AND Products.Name = ProductsInShops.ProductName
group by ProductName;
