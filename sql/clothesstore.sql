--Comment Liz 

CREATE TABLE marca (id_marca integer, nombre_marca varchar(30))

CREATE TABLE temporada (id_temporada integer, nombre_temporada varchar(30))

CREATE TABLE tallas (id_talla integer, nombre_talla varchar(30))

create table season_discount (
season_discount_id int NOT NULL primary key,
season_id int not null,
discount int,
note varchar(100)
);

create table department(
departmentid int NOT NULL primary key,
namedeparment varchar(30)
);

create table daysales (
daysalesid int NOT NULL primary key,
salesdate date,
salesvendorid int,
priceid int
);

create table historic (
historicid int NOT NULL primary key,
historicdate date,
daysalesid int
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



