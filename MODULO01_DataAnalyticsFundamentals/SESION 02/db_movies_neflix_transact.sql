CREATE DATABASE db_movies_netflix_transact;
USE db_movies_netflix_transact;

-- CREAMOS LA TABLA persona
CREATE TABLE persona (
  personaID  VARCHAR(8) PRIMARY KEY NOT NULL,
  nombre VARCHAR(50) NOT NULL,
  fechaCumpleaños DATE NOT NULL
);

-- CREAMOS LA TABLA pelicula
CREATE TABLE pelicula (
  peliculaID  VARCHAR(8) PRIMARY KEY NOT NULL,
  titulo VARCHAR(50) NOT NULL,
  fechaLanzamiento DATE NOT NULL,
  idiomaOriginal VARCHAR(20) DEFAULT NULL,
  link VARCHAR(500) DEFAULT NULL
);

-- CREAMOS LA TABLA genero
CREATE TABLE genero (
  generoID INTEGER PRIMARY KEY NOT NULL,
  generoNombre VARCHAR(50) NOT NULL
);

-- INSERTAMOS VALORES A LA TABLA persona
INSERT INTO persona VALUES ("72129839","Joseph Chavez Pineda","1997-04-12"),
("73235434","Maria Lopez Gutierrez","1987-05-21"),
("20432364","Maria Alejandra Navarro","1967-01-05");

-- INSERTAMOS VALORES A LA TABLA pelicula
INSERT INTO pelicula VALUES ("80192187","Triple Frontier","2019-04-12","English","https://www.netflix.com/pe-en/title/80192187"),
("81157374","Run","2021-05-21","English","https://www.netflix.com/pe-en/title/81157374"),
("80210920","The Mother","2023-01-05","English","https://www.netflix.com/pe-en/title/80210920");

-- INSERTAMOS VALORES A LA TABLA genero
INSERT INTO genero VALUES (1,"Action"),
(2,"Adventure"),
(3,"Drama");
                            
-- CREAMOS LA TABLA pelicula_persona
CREATE TABLE pelicula_persona (
  peliculaID VARCHAR(8) PRIMARY KEY NOT NULL,
  personaID VARCHAR(8),
  rol VARCHAR(50),

  CONSTRAINT fk_pelicula_persona_pelicula FOREIGN KEY (peliculaID) REFERENCES pelicula (peliculaID),
  CONSTRAINT fk_pelicula_persona_persona FOREIGN KEY (personaID) REFERENCES persona (personaID)
);

-- INSERTAMOS VALORES A LA TABLA pelicula_persona
INSERT INTO pelicula_persona VALUES ("80192187","72129839","Actor"),
("81157374","73235434","Director"),
("80210920","20432364","Actor");

-- CREAMOS LA TABLA pelicula_genero
CREATE TABLE pelicula_genero (
  peliculaID varchar(8) PRIMARY KEY NOT NULL,
  generoID INTEGER,
  
  CONSTRAINT fk_pelicula_genero_pelicula FOREIGN KEY (peliculaID) REFERENCES pelicula (peliculaID),
	CONSTRAINT fk_pelicula_genero_genero FOREIGN KEY (generoID) REFERENCES genero (generoID)
);

-- INSERTAMOS VALORES A LA TABLA pelicula_genero
INSERT INTO pelicula_genero VALUES ("80192187",1),
("81157374",2),
("80210920",3);