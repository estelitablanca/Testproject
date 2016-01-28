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
season_id int not null ,
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
sales_person_id int ,
priceid int,
FOREIGN KEY (sales_person_id) REFERENCES sales_person (sales_person_id)
);


CREATE TABLE historic (
historic_id int NOT NULL primary key,
historic_date date,
daysales_id int,
FOREIGN KEY (daysales_id) REFERENCES daysales (daysales_id)
);


create table paymenttype (
paymenttype_id int NOT NULL primary key,
paymentname varchar(30)
);


create table comision (
comision_id int NOT NULL primary key,
amount int,
note varchar(100),
sales_person_id int ,
FOREIGN KEY (sales_person_id) REFERENCES sales_person (sales_person_id)
);


create table salary (
salary_id int NOT NULL primary key,
pay int,
tax float,
note varchar(100),
sales_person_id int ,
FOREIGN KEY (sales_person_id) REFERENCES sales_person (sales_person_id)
);


create table itemsubtype (
itemsubtype_id int,
nameitemsubtype varchar (30)
);


--Categories like: suits, skirts, shirts, shorts, dresses, pants, coats, etc 

alter table itemsubtype add primary key (itemsubtype_id);

create table itemtype (
itemtype_id int NOT NULL primary key,
nameitem varchar(40),
itemsubtype_id int ,
FOREIGN KEY (itemsubtype_id) REFERENCES itemsubtype(itemsubtype_id)
);


-- Contains the subcategories like:
	-- Category= swimsuit
		--Subcategory = bikini,  boardshorts, jammers, swim trunks, briefs or "speedos", thongs, g-strings, etc 


CREATE TABLE article (
article_id int not null primary key,
article_name varchar(30),
trademark_id int ,
size_id int ,
price_id int ,
FOREIGN KEY (size_id) REFERENCES size (size_id),
FOREIGN KEY (trademark_id) REFERENCES trademark (trademark_id)
);


CREATE TABLE supplier (
supplier_id int not null primary key,
name varchar(30),
article_id int,
FOREIGN KEY (article_id) REFERENCES article (article_id)
);

CREATE TABLE warehouse (
warehouse_id int not null primary key,
quantity int,
article_id int,
supplier_id int,
FOREIGN KEY (article_id) REFERENCES article (article_id),
FOREIGN KEY (supplier_id) REFERENCES supplier (supplier_id)
);

CREATE TABLE price (
  price_id int not null primary key,
  price varchar(30),
  season_discount_id int,
  FOREIGN KEY (season_discount_id) REFERENCES season_discount (season_discount_id)
);

alter table season_discount add FOREIGN KEY (season_id) REFERENCES season (season_id);
alter table article add FOREIGN KEY (price_id)REFERENCES price (price_id);
