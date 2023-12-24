create database IDBAss
use IDBAss

create table members
(memberId nvarchar(50) not null primary key,
memberName nvarchar(50),
memberAddress nvarchar(50),
email nvarchar(50),
ContactNum nvarchar(50),
Age int);

create table publisher
(publisherId nvarchar(50) not null primary key,
pub_Name nvarchar(50));

create table author
(authorId nvarchar(50) not null primary key,
name nvarchar (50));

create table books
(bookId nvarchar(50) not null primary key,
bookName nvarchar(50),
genre nvarchar(50),
price nvarchar(50),
publisheddate date,
publisherId nvarchar(50)foreign key references publisher(publisherId),
authorId nvarchar(50) foreign key references author(authorId));

create table orders
(orderId nvarchar(50) not null primary key,
quantity nvarchar(50),
total nvarchar(50),
bookId nvarchar(50)foreign key references books(bookID));

create table publisher_order
(pub_orderId nvarchar(50) not null primary key,
publisherId nvarchar(50) not null foreign key references publisher(publisherId),
orderId nvarchar(50) not null foreign key references orders(orderId));

create table cart
(cartId nvarchar(50) not null primary key,
quantity int,
memberId nvarchar(50) foreign key references members(memberId),
bookId nvarchar(50) foreign key references books(bookId));

create table review
(reviewId nvarchar(50) not null primary key,
review nvarchar(50),
memberId nvarchar(50) foreign key references members(memberId),
bookId nvarchar(50) foreign key references books(bookId));

create table invoice
(invoiceId nvarchar(50) not null primary key,
invoice_date date,
delivery_status nvarchar(50),
total int);

create table paymentDetails
(paymentId nvarchar(50) not null primary key,
cartId nvarchar(50) foreign key references cart(cartId),
invoiceId nvarchar(50) foreign key references invoice(invoiceId));

insert into members values('M0001','Rachel','124 England,EG12345','rachel@mail.com',0112398674,20),('M0002','Stephanie','356 England,EG35125','steph@mail.com',012364787,20),('M0003','Michelle','679 England,EG67098','michelle@mail.com',013891364,19),('M0004','Jenn','575 England,EG57097','jenn@mail.com',011237864,23),('M0005','Tom','219 England,21968','tom@mail.com',0117838678,25);
insert into publisher values('P012','Weston'),('P010','Grinch'),('P001','Kenston'),('P015','Shawn'),('P016','John');
insert into author values('A001','James'),('A012','John'),('A023','Cynthia'),('A041','Belle'),('A037','Mlly');
insert into books values('B01','English','Education',40,'12 January 2022','P012','A001'),('B02','French','Education',60,'2 March 2022','P012','A001'),('B03','Geography','Education',45,'25 April 2022','P001','A023'),('B04','Gone Girl','Mystery',50,'20 January 2015','P015','A041'),('B05','Six of Crows','Fantasy',50,'12 June 2012','P016','A037');
insert into orders values('O0012',2,80,'B01'),('O0013',1,60,'B02'),('O0014',1,45,'B03'),('O0023',3,150,'B04'),('O0024',1,50,'B04');
insert into publisher_order values('PO01','P012','O0012'),('PO02','P010','O0013'),('PO03','P001','O0014'),('PO12','P015','O0023'),('PO22','P016','O0024');
insert into cart values('C012',2,'M0001','B01'),('C013',1,'M0001','B02'),('C014',1,'M0001','B03'),('C023',3,'M0002','B04'),('C035',1,'M0003','B04');
insert into review values('R001','Book quality is great','M0001','B01'),('R002','Content of the book is hard to understand.','M0001','B02'),('R003','Great book. Would read again','M0001','B03'),('R004','the plot twist was so good','M0002','B04'),('R005','plot twist predictable and cliche','M0003','B04');
insert into invoice values('I067','12 January 2023','Delivered',80),('I068','12 January 2023','Delivered',60),('I069','12 January 2023','Processing',45),('I045','20 February 2023','Processing',150),('I089','28 January 2023','Delivered',50);
insert into paymentDetails values('PY023','C012','I067'),('PY024','C013','I067'),('PY025','C014','I067'),('PY079','C023','I045'),('PY120','C035','I089');

