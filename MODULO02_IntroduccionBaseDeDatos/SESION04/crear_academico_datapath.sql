# Aquí estamos creando la base de datos 
CREATE DATABASE academico_datapath;

## Usando la base de datos academico_datapath
USE academico_datapath;

## creando la tabla coordinador
CREATE TABLE coordinador (
	codigo_coordinador INT PRIMARY KEY,
    fecha_integro DATE,
    dni VARCHAR(8),
    nombres VARCHAR(100),
    direccion VARCHAR (100)
);

INSERT INTO coordinador VALUES 	(1,"2021-10-12","73238475","Joseph Chavez Pineda","Av Puente piedra 543 - Surco"),
								(2,"2023-01-02","72128374","Piero Quispe","Avenida Perú 115 - Lima"),
								(3,"2023-01-03","73235443","Mariano Aguilar","Jr España 113 - Ayacucho"),
                                (4,"2022-11-04","13235442","Maria Lopez Gutierrez",""),
                                (5,"2022-12-14","54346545","Marcelino Chavez Soto",""),
                                (6,"2023-02-14","87565435","Victor Manuel Garcia","av Perú 114 - Los olivos"),
                                (7,"2023-01-17","87567645","Maria Alejandra Navarro","Jr los libertadores 5434 mz. 16 lote 12 - Breña"),
                                (8,"2023-03-06","27463546","José Mariano Arones Quispe","Av independencia 432 - Ate"),
                                (9,"2022-10-11","98678765","Ruth Aguilar Moreno","Jr Grau 749 - SJL - Comas"),
                                (10,"2022-11-19","23543465","Edith Soler Mendez","Av. tarapacá 456 - Surco");

## CREAMOS LA TABLA ESTUDIANTES
CREATE TABLE estudiante (
	dni_estudiante VARCHAR(8) PRIMARY KEY NOT NULL,
    nombre VARCHAR(100),
    telefono VARCHAR(15),
    domicilio VARCHAR(100),
    cv VARCHAR(100)
);

# insertando valores a la tabla estudiante
INSERT INTO estudiante VALUES 	("76565434","Andrés Ignacio Garcia Ruiz","+51985654347","Av Puente piedra 543 - Surco","https://drive.google.com/file/d/1rIcJ/view?usp=sharing"),
								("23423525","Jeisser Augusto Asto Sifuentes","+51987656543","Av Puente piedra 543 - Lima","https://drive.google.com/file/d/1rIcJ/view?usp=sharing"),
                                ("45646647","Gianella Matamoros Jara","+51787656453","jr España 113 - Ayacucho","https://drive.google.com/file/d/1rIcJ/view?usp=sharing"),
                                ("34534576","Elayne Palacios Vargas","+51987867567","av Perú 114 - Los olivos","https://drive.google.com/file/d/1rIcJ/view?usp=sharing"),
                                ("34534634","Esteban Vargas","+51985654347","Jr. Ucayali N° 388  - SJL","https://drive.google.com/file/d/1rIcJ/view?usp=sharing"),
                                ("34634636","Randy Leonel Barberena Morera","+51785634239","Av. tarapacá 456 - Surco","https://drive.google.com/file/d/1rIcJ/view?usp=sharing"),
                                ("34636567","Lorenzo Eduardo Reyes Flores","+51897876543","Av. tarapacá 456 - Surco","https://drive.google.com/file/d/1rIcJ/view?usp=sharing"),
                                ("56756776","Clemente Sisinio Reyes Flores","+51873635537","Urb. Mariscal Cáceres Mz. L Lote 30 - VMT","https://drive.google.com/file/d/1rIcJ/view?usp=sharing"),
                                ("23423442","Kenyo Harold Cano Campos","+51097867656","Jr 28 De Julio 537 A Cercado - Surco","https://drive.google.com/file/d/1rIcJ/view?usp=sharing"),
                                ("65756756","Yanina Montañez Monasterio","+51345465778","Jr 28 De Julio 148","https://drive.google.com/file/d/1rIcJ/view?usp=sharing"),
                                ("45645647","Fabian Calderon","+51456789964","Jr. Camaná 616  - Surco","https://drive.google.com/file/d/1rIcJ/view?usp=sharing"),
                                ("45647836","Gerardo Gabriel Silva","+51456675786","Jr.Callao 122 1er.Piso Cercado - Ayacucho","https://drive.google.com/file/d/1rIcJ/view?usp=sharing"),
                                ("34534573","Christian Caballero Mueras","+51234264657","Av Independencia Cda 06 Ex Casa Campesin - La victoria","https://drive.google.com/file/d/1rIcJ/view?usp=sharing");

## CREANDO LA TABLA PROGRAMA DEL CASO DE USO
CREATE TABLE programa (
  codigo_programa INTEGER PRIMARY KEY NOT NULL,
  descripcion VARCHAR(100) NOT NULL,
  inversion DECIMAL(7,3) NOT NULL,
  horario_clases VARCHAR(100) NOT NULL,
  codigo_coordinador INT NOT NULL,
  
  CONSTRAINT fk_programa_coordinador FOREIGN KEY (codigo_coordinador) REFERENCES coordinador (codigo_coordinador)
);

# insertamos valores a la tabla programa
INSERT INTO programa VALUES (1,"Data Analyst Program I Edición",600,"Lunes-Miercoles-Jueves | 7:00 pm - 10pm",4),
							(2,"Data Analyst Program II Edición",700,"Lunes-Miercoles-Jueves | 7:00 pm - 10pm",5),
                            (3,"Data Analyst Program III Edición",550,"Martes-Miercoles-Viernes | 7:00 pm - 10pm",6),
                            (4,"Data Engineer Program I Edición",800,"Lunes-Miercoles-Viernes | 7:00 pm - 10pm",1),
                            (5,"Data Engineer Program II Edición",450,"Martes-Jueves-Sábado | 7:00 pm - 10pm",2),
                            (6,"Data Scientist Program I Edición",850,"Lunes-Miercoles-Sábado | 7:00 pm - 10pm",10),
                            (7,"Data Scientist Program II Edición",650,"Martes-Miercoles-Sábado | 7:00 pm - 10pm",9);

## creamos la tabla tutor
CREATE TABLE tutor (
  dni_tutor varchar(8) PRIMARY KEY NOT NULL,
  linkedin varchar(100),
  nombre varchar(100) NOT NULL
);

#insertamos valores a la tabla tutor
INSERT INTO tutor VALUES 	("76565434","https://www.linkedin.com/in/GerardoRodriguez","Gerardo Rodriguez Valer"),
							("12312412","https://www.linkedin.com/in/Augusto","Augusto Sotomayor Mendez"),
                            ("23423441","https://www.linkedin.com/in/Jordy","Jordy Quintanilla Perez"),
                            ("25352356","https://www.linkedin.com/in/Jeremy","Jeremy Alarcon Morales"),
                            ("34563466","https://www.linkedin.com/in/Jorge","Jorge Ramires Lopez"),
                            ("65756778","https://www.linkedin.com/in/PatriciaNavarro","Patricia Salazar  Navarro"),
                            ("58568536","https://www.linkedin.com/in/FredyVega","Fredy Vega Quispe");

## crear la tabla programa_estudiante
CREATE TABLE programa_estudiante (
  id_programa_estudiante INTEGER PRIMARY KEY NOT NULL AUTO_INCREMENT,
  codigo_programa INTEGER,
  dni_estudiante VARCHAR(8),
  fecha_matricula DATE,

  CONSTRAINT fk_programa_estudiante_estudiante FOREIGN KEY (dni_estudiante) REFERENCES estudiante(dni_estudiante),
  CONSTRAINT fk_programa_estudiante_programa FOREIGN KEY (codigo_programa) REFERENCES programa (codigo_programa)
  
);

#insertamos datos a la tabla programa_estudiante
INSERT INTO programa_estudiante VALUES 	(0,1,"23423442","2023-01-01"),
										(0,2,"23423525","2023-01-04"),
                                        (0,3,"34534573","2023-01-10"),
                                        (0,4,"34534576","2023-01-11"),
                                        (0,5,"34534634","2023-01-20"),
                                        
                                        (0,6,"34634636","2023-03-02"),
                                        (0,7,"34636567","2023-03-02"),
                                        (0,6,"45645647","2023-03-12"),
                                        (0,5,"45646647","2023-03-25"),
                                        
                                        (0,7,"65756756","2023-02-23");

# creamos la tabla programa tutor
CREATE TABLE programa_tutor (
  id_programa_tutor INTEGER PRIMARY KEY NOT NULL AUTO_INCREMENT,
  codigo_programa INTEGER NOT NULL,
  dni_tutor VARCHAR(8) NOT NULL,
  fecha_asignacion DATETIME NOT NULL,

  CONSTRAINT fk_programa_tutor_programa FOREIGN KEY (codigo_programa) REFERENCES programa (codigo_programa),
  CONSTRAINT fk_programa_tutor_tutor FOREIGN KEY (dni_tutor) REFERENCES tutor (dni_tutor)
  
);

# insertamos datos a la tabla programa_tutor
INSERT INTO programa_tutor VALUES 	(0,1,"76565434","2022-11-01"),
										(0,2,"12312412","2022-12-04"),
                                        (0,3,"23423441","2022-11-10"),
                                        (0,4,"25352356","2022-11-11"),
                                        (0,5,"34563466","2022-10-20"),
                                        (0,6,"65756778","2022-11-22"),
                                        (0,7,"58568536","2022-12-27");
