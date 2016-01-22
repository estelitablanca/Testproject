--Comment Liz 

CREATE TABLE trademark (
trademark_id int not null primary key
mark_name varchar(30)
);

CREATE TABLE season (
season_id int not null primary key
season_name varchar(30)
);

CREATE TABLE size (
size_id int not null primary key 
size_name varchar(30)
);

CREATE TABLE article (
article_id int not null primary key 
article_name varchar(30),
FOREIGN KEY (id_marca) REFERENCES marca (id_marca),
FOREIGN KEY (id_talla) REFERENCES tallas (id_talla),
FOREIGN KEY (id_precio) REFERENCES precios (id_precio)
);

CREATE TABLE sales_person (
sales_person_id int not null primary key 
name varchar(30),
lastname varchar(30),
age int,
entry_date date,
school_level varchar(30)
);

CREATE TABLE price (
price_id int not null primary key 
price varchar(30),
FOREIGN KEY (discount) REFERENCES season_discount (discount),
FOREIGN KEY (article) REFERENCES article (article_name)
);

CREATE TABLE season_discount (
season_discount_id int NOT NULL primary key,
season_id int not null,
discount int,
note varchar(100)
);

CREATE TABLE department(
department_id int NOT NULL primary key,
namedeparment varchar(30)
);

CREATE TABLE daysales (
daysales_id int NOT NULL primary key,
salesdate date,
salesvendorid int,
priceid int
);

CREATE TABLE historic (
historic_id int NOT NULL primary key,
historic_date date,
daysales_id int
);
create table paymenttype (
paymenttype_id int NOT NULL primary key,
paymentname varchar(30),
);

create table comision (
comision_id int NOT NULL primary key,
amount int,
note varchar(100),
salesperson_id int
);


create table salary (
salary_id int NOT NULL primary key,
pay int,
tax float,
note varchar(100),
salesperson_id int
);

create table itemtype (
itemtype_id int NOT NULL primary key,
nameitem varchar(40),
itemsubtype_id int
);



