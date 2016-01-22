--Comment Liz 

CREATE TABLE marca (
id_marca int not null primary key
nombre_marca varchar(30)
);

CREATE TABLE temporada (
id_temporada int not null primary key
nombre_temporada varchar(30)
);

CREATE TABLE tallas (
id_talla int not null primary key 
nombre_talla varchar(30)
);

CREATE TABLE articulos (
id_articulo int not null primary key 
nombre_articulo varchar(30),
FOREIGN KEY (id_marca) REFERENCES marca (id_marca),
FOREIGN KEY (id_talla) REFERENCES tallas (id_talla),
FOREIGN KEY (id_precio) REFERENCES precios (id_precio),
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


