--Comment Liz 

--drop table season
--drop table size
--drop table trademark
--drop table season_discount
--drop table comision
--drop table daysales
--drop table deparment
--drop table historic
--drop table itemsubtype
--drop table paymenttype
--drop table salary
--drop table sales_person

CREATE TABLE trademark (
trademark_id int not null primary key,
trademark_name varchar(30)
);

CREATE TABLE season (
season_id int not null primary key,
season_name varchar(30)
);

CREATE TABLE size (
size_id int not null primary key,
size_name varchar(30)
);



CREATE TABLE sales_person (
sales_person_id int not null primary key,
name varchar(30),
lastname varchar(30),
age int,
entry_date date,
school_level varchar(30)
);



CREATE TABLE season_discount (
season_discount_id int NOT NULL primary key,
season_id int not null FOREIGN KEY REFERENCES season (season_id),
discount float,
note varchar(100)
);

CREATE TABLE department(
department_id int NOT NULL primary key,
namedeparment varchar(30)
);

CREATE TABLE daysales (
daysales_id int NOT NULL primary key,
salesdate date,
sales_person_id int FOREIGN KEY REFERENCES sales_person (sales_person_id),
priceid int
);

CREATE TABLE historic (
historic_id int NOT NULL primary key,
historic_date date,
daysales_id int FOREIGN KEY REFERENCES daysales (daysales_id)
);

create table paymenttype (
paymenttype_id int NOT NULL primary key,
paymentname varchar(30),
);

create table comision (
comision_id int NOT NULL primary key,
amount int,
note varchar(100),
sales_person_id int FOREIGN KEY REFERENCES sales_person (sales_person_id)
);


create table salary (
salary_id int NOT NULL primary key,
pay int,
tax float,
note varchar(100),
sales_person_id int FOREIGN KEY REFERENCES sales_person (sales_person_id)
);

create table itemsubtype (
itemsubtype_id int,
nameitemsubtype varchar (30)
);

--Categories like: suits, skirts, shirts, shorts, dresses, pants, coats, etc 
create table itemtype (
itemtype_id int NOT NULL primary key,
nameitem varchar(40),
itemsubtype_id int FOREIGN KEY REFERENCES itemsubtype(itemsubtype_id)
);


-- Contains the subcategories like:
	-- Category= swimsuit
		--Subcategory = bikini,  boardshorts, jammers, swim trunks, briefs or "speedos", thongs, g-strings, etc 


CREATE TABLE article (
article_id int not null primary key,
article_name varchar(30),
trademark_id int FOREIGN KEY REFERENCES trademark (trademark_id),
size_id int FOREIGN KEY REFERENCES size (size_id),
price_id int FOREIGN KEY REFERENCES price (price_id)
);

CREATE TABLE supplier (
supplier_id int not null primary key,
name varchar(30),
FOREIGN KEY (article_id) REFERENCES article (article_id)
);

CREATE TABLE warehouse (
warehouse_id int not null primary key,
quantity int,
FOREIGN KEY (article_id) REFERENCES article (article_id),
FOREIGN KEY (supplier_id) REFERENCES supplier (supplier_id)
);

CREATE TABLE price (
price_id int not null primary key,
price varchar(30),
FOREIGN KEY (discount) REFERENCES season_discount (discount),
FOREIGN KEY (article) REFERENCES article (article_name)
);