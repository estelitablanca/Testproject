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

---Trademarks ---
insert into trademark (trademark_id, trademark_name) values (1, 'Guess');
insert into trademark (trademark_id, trademark_name) values (2, 'Gap');
insert into trademark (trademark_id, trademark_name) values (3, 'Calvin');

-- article----
insert into article (article_id, article_name, trademark_id, size_id, price_id) values (0, 'Short', 1, 1,1);
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

alter table itemtype drop column itemsubtype_id;
alter table itemsubtype add itemtype_id int;
alter table itemsubtype add FOREIGN KEY (itemtype_id) REFERENCES itemtype (itemtype_id);

-- itemtype
insert into itemtype (itemtype_id, nameitem) values (0, 'Swimwear for Women');
insert into itemtype (itemtype_id, nameitem) values (1, 'Swimwear for Men');
insert into itemtype (itemtype_id, nameitem) values (2, 'Coats & Jackets');
insert into itemtype (itemtype_id, nameitem) values (3, 'Shoes for Women');
insert into itemtype (itemtype_id, nameitem) values (4, 'Shoes for Men');

--itemsubtype
update itemsubtype set itemtype_id = 0 WHERE itemsubtype_id = 0;
update itemsubtype set itemtype_id = 0 WHERE itemsubtype_id = 1;
update itemsubtype set itemtype_id = 0 WHERE itemsubtype_id = 2;
update itemsubtype set itemtype_id = 0 WHERE itemsubtype_id = 3;
update itemsubtype set itemtype_id = 0 WHERE itemsubtype_id = 4;
update itemsubtype set itemtype_id = 1 WHERE itemsubtype_id = 5;
update itemsubtype set itemtype_id = 1 WHERE itemsubtype_id = 6;
update itemsubtype set itemtype_id = 1 WHERE itemsubtype_id = 7;
update itemsubtype set itemtype_id = 2 WHERE itemsubtype_id = 8;
update itemsubtype set itemtype_id = 2 WHERE itemsubtype_id = 9;
update itemsubtype set itemtype_id = 2 WHERE itemsubtype_id = 10;
update itemsubtype set itemtype_id = 2 WHERE itemsubtype_id = 11;
update itemsubtype set itemtype_id = 2 WHERE itemsubtype_id = 12;
update itemsubtype set itemtype_id = 2 WHERE itemsubtype_id = 13;
update itemsubtype set itemtype_id = 3 WHERE itemsubtype_id = 14;
update itemsubtype set itemtype_id = 3 WHERE itemsubtype_id = 15;
update itemsubtype set itemtype_id = 3 WHERE itemsubtype_id = 16;
update itemsubtype set itemtype_id = 3 WHERE itemsubtype_id = 17;
update itemsubtype set itemtype_id = 3 WHERE itemsubtype_id = 18;
update itemsubtype set itemtype_id = 4 WHERE itemsubtype_id = 19;
update itemsubtype set itemtype_id = 4 WHERE itemsubtype_id = 20;

--itemsubtype
insert into itemsubtype (itemsubtype_id, nameitemsubtype, itemtype_id) values (21, 'Boots',4 );

select itemsubtype_id, nameitemsubtype, itemtype.nameitem from itemsubtype LEFT JOIN itemtype ON (itemsubtype.itemtype_id = itemtype.itemtype_id);

-- paymenttype
insert into paymenttype (paymenttype_id, paymentname) values (0, 'Cash');
insert into paymenttype (paymenttype_id, paymentname) values (1, 'Credit Card');
insert into paymenttype (paymenttype_id, paymentname) values (2, 'Debit Card');
insert into paymenttype (paymenttype_id, paymentname) values (3, 'Check');
insert into paymenttype (paymenttype_id, paymentname) values (4, 'Food Stamps');

-- salary

alter table salary RENAME column "pay" TO "payment";
alter table salary RENAME column "tax" TO "taxes";
alter table salary alter column payment TYPE float;
ALTER TABLE salary DROP CONSTRAINT salary_sales_person_id_fkey;
alter table salary drop column sales_person_id;
alter table sales_person add salary int;
alter table sales_person add FOREIGN KEY (salary) REFERENCES salary (salary_id);

-- salary
insert into salary (salary_id, payment, taxes, note) values (0, 1250, 350, 'New member');
insert into salary (salary_id, payment, taxes) values (1, 2250, 350);
insert into salary (salary_id, payment, taxes, note) values (2, 3250, 350, 'Some notes for this element as example');
insert into salary (salary_id, payment, taxes, note) values (3, 4250, 350, 'None');
insert into salary (salary_id, payment, taxes, note) values (4, 5250, 350, 'Manager');

update sales_person set salary = 0 WHERE sales_person_id = 1;
update sales_person set salary = 1 WHERE sales_person_id = 2;

select sales_person_id, firstname, lastname, age, entry_date, school_level, salary.payment from sales_person LEFT JOIN salary ON (sales_person.salary = salary.salary_id);




--supplier

insert into supplier (supplier_id, name, article_id) values (0,'Guess store',1);
insert into supplier (supplier_id, name, article_id) values (1,'Gap store',1);


-- warehouse

insert into warehouse (warehouse_id, quantity, article_id, supplier_id) values (0,2,2,0);
insert into warehouse (warehouse_id, quantity, article_id, supplier_id) values (1,1,1,1);




