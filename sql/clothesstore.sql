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
alter table size add size_description varchar(20);
alter table sales_person RENAME COLUMN "name" TO "firstname";


--Inserts to size table --- 
insert into size (size_id, size_name, size_description) values (0, 'OS', 'One size fits all');
insert into size (size_id, size_name, size_description) values (1, 'S', 'Small');
insert into size (size_id, size_name, size_description) values (2, 'M', 'Medium');
insert into size (size_id, size_name, size_description) values (3, 'L', 'Large');
insert into size (size_id, size_name, size_description) values (4, 'XL', 'Extra Large');
insert into size (size_id, size_name, size_description) values (5, 'XXL', 'Extra Extra Large');
insert into size (size_id, size_name, size_description) values (6, 'XXXL', 'Extra Extra Large');


-- Season
insert into season (season_id, season_name) values (0, 'All season');
insert into season (season_id, season_name) values (1, 'Spring');
insert into season (season_id, season_name) values (2, 'Summer');
insert into season (season_id, season_name) values (3, 'Fall');
insert into season (season_id, season_name) values (4, 'Winter');

-- Descuentos de temporada con nota
insert into season_discount (season_discount_id, season_id,discount, note) values (0, 0, '00', 'Not discount');
insert into season_discount (season_discount_id, season_id,discount, note) values (1, 1, '10', 'Shirt');
insert into season_discount (season_discount_id, season_id,discount, note) values (2, 2, '20', 'Dress');
insert into season_discount (season_discount_id, season_id,discount, note) values (3, 2, '30', 'Coat');
insert into season_discount (season_discount_id, season_id,discount, note) values (4, 3, '5', 'skirt');
insert into season_discount (season_discount_id, season_id,discount, note) values (5, 4, '50', 'suit');

-- precios
insert into price (price_id, price, season_discount_id) values (1, 10,2);
insert into price (price_id, price, season_discount_id) values (2, 20, 1);
insert into price (price_id, price, season_discount_id) values (3, 100, 0);

---Brands ---
insert into trademark (trademark_id, trademark_name) values (1, 'Guess');
insert into trademark (trademark_id, trademark_name) values (2, 'Gap');
insert into trademark (trademark_id, trademark_name) values (3, 'Calvin');

-- Item ----
insert into article (article_id, article_name, trademark_id, size_id, price_id) values (1, 'Short', 1, 1,1);
insert into article (article_id, article_name, trademark_id, size_id, price_id) values (1, 'Umbrella', 2, 0, 3);

--- sales person
insert into sales_person (sales_person_id, firstname, lastname, age, entry_date, school_level)
values (1, 'Brad', 'Pitt', 45, '2015-01-23','high school');
insert into sales_person (sales_person_id, firstname, lastname, age, entry_date, school_level)
values (2, 'Ricky', 'Martin', 41, '2011-05-23','kinder');

--Comision ---
insert into comision (comision_id, amount, note,sales_person_id) values (1, 100, 'puntuality', 1);
insert into comision (comision_id, amount, note,sales_person_id) values (2, 800, 'energy', 2);


--- Daysales
insert into daysales (daysales_id, salesdate, sales_person_id, priceid) values (1, '2015-01-29', 1, 2);
insert into daysales (daysales_id, salesdate, sales_person_id, priceid) values (2, '2015-01-29', 2, 3);
insert into daysales (daysales_id, salesdate, sales_person_id, priceid) values (3, '2015-01-29', 2, 4);
insert into daysales (daysales_id, salesdate, sales_person_id, priceid) values (4, '2015-01-29', 1, 2);

--department
insert into department (department_id, namedeparment) values (1, 'Ladies');
insert into department (department_id, namedeparment) values (2, 'Men');
insert into department (department_id, namedeparment) values (3, 'Kids');
insert into department (department_id, namedeparment) values (4, 'Women');
insert into department (department_id, namedeparment) values (5, 'Animals');
insert into department (department_id, namedeparment) values (6, 'Underwear');
insert into department (department_id, namedeparment) values (7, 'Swimwear');

--Historic
insert into historic (historic_id, historic_date, daysales_id) values (1, '2015-1-29', 1);
insert into historic (historic_id, historic_date, daysales_id) values (2, '2015-1-29', 2);
insert into historic (historic_id, historic_date, daysales_id) values (3, '2015-1-29', 3);


--itemsubtype
insert into itemsubtype (itemsubtype_id, nameitemsubtype) values (0, 'Bikini');
insert into itemsubtype (itemsubtype_id, nameitemsubtype) values (1, 'One-piece');
insert into itemsubtype (itemsubtype_id, nameitemsubtype) values (2, 'Swim Dress');
insert into itemsubtype (itemsubtype_id, nameitemsubtype) values (3, 'Cover-up');
insert into itemsubtype (itemsubtype_id, nameitemsubtype) values (4, 'Tankini');
insert into itemsubtype (itemsubtype_id, nameitemsubtype) values (5, 'Board Shorts');
insert into itemsubtype (itemsubtype_id, nameitemsubtype) values (6, 'Swim Trunks');
insert into itemsubtype (itemsubtype_id, nameitemsubtype) values (7, 'Hybrids');
insert into itemsubtype (itemsubtype_id, nameitemsubtype) values (8, 'Raincoats');
insert into itemsubtype (itemsubtype_id, nameitemsubtype) values (9, 'Overcoats');
insert into itemsubtype (itemsubtype_id, nameitemsubtype) values (10, 'Peacoats');
insert into itemsubtype (itemsubtype_id, nameitemsubtype) values (11, 'Parkas');
insert into itemsubtype (itemsubtype_id, nameitemsubtype) values (12, 'Ski');
insert into itemsubtype (itemsubtype_id, nameitemsubtype) values (13, 'Vests');
insert into itemsubtype (itemsubtype_id, nameitemsubtype) values (14, 'Sandals');
insert into itemsubtype (itemsubtype_id, nameitemsubtype) values (15, 'Heels');
insert into itemsubtype (itemsubtype_id, nameitemsubtype) values (16, 'Flats');
insert into itemsubtype (itemsubtype_id, nameitemsubtype) values (17, 'Boots');
insert into itemsubtype (itemsubtype_id, nameitemsubtype) values (18, 'Slippers');
insert into itemsubtype (itemsubtype_id, nameitemsubtype) values (19, 'Oxfords');
insert into itemsubtype (itemsubtype_id, nameitemsubtype) values (20, 'Dress Shoes');

-- itemtype
insert into itemtype (itemtype_id, nameitem, itemsubtype_id) values (0, 'Swimwear for Women', 0);
insert into itemtype (itemtype_id, nameitem, itemsubtype_id) values (1, 'Swimwear for Women', 1);
insert into itemtype (itemtype_id, nameitem, itemsubtype_id) values (2, 'Swimwear for Women', 2);
insert into itemtype (itemtype_id, nameitem, itemsubtype_id) values (3, 'Swimwear for Women', 3);
insert into itemtype (itemtype_id, nameitem, itemsubtype_id) values (4, 'Swimwear for Women', 4);
insert into itemtype (itemtype_id, nameitem, itemsubtype_id) values (5, 'Swimwear for Men', 5);
insert into itemtype (itemtype_id, nameitem, itemsubtype_id) values (6, 'Swimwear for Men', 6);
insert into itemtype (itemtype_id, nameitem, itemsubtype_id) values (7, 'Swimwear for Men', 7);
insert into itemtype (itemtype_id, nameitem, itemsubtype_id) values (8, 'Coats & Jackets', 8);
insert into itemtype (itemtype_id, nameitem, itemsubtype_id) values (9, 'Coats & Jackets', 9);
insert into itemtype (itemtype_id, nameitem, itemsubtype_id) values (10, 'Coats & Jackets', 10);
insert into itemtype (itemtype_id, nameitem, itemsubtype_id) values (11, 'Coats & Jackets', 11);
insert into itemtype (itemtype_id, nameitem, itemsubtype_id) values (12, 'Coats & Jackets', 12);
insert into itemtype (itemtype_id, nameitem, itemsubtype_id) values (13, 'Coats & Jackets', 13);
insert into itemtype (itemtype_id, nameitem, itemsubtype_id) values (14, 'Coats & Jackets', 14);






