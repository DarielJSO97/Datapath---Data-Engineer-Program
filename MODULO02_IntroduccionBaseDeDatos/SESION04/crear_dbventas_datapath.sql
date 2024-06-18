CREATE DATABASE dbventas_datapath;
USE dbventas_datapath;


/* CREAMOS LA TABLA VENDEDOR */
CREATE TABLE vendedor (
  idvendedor INTEGER PRIMARY KEY  NOT NULL,
  nombre VARCHAR(100) NOT NULL,
  sexo CHAR(1) NOT NULL,
  dirección VARCHAR(100) DEFAULT NULL
);

INSERT INTO vendedor VALUES (1,"Fredy Saavedra","M","AV la merced - Colombia"),
							(2,"Maria Cisneros","F","jr manco capac 118 SJM"),
                            (3,"Deisser Martinez","M","pasaje la cultura 234 Arequipa Perú");



/*CREAMOS LA TABLA VENTAS_PROGRAMA*/
CREATE TABLE ventas_programa (
  idventas_programa INTEGER PRIMARY KEY  NOT NULL,
  idEstudiante VARCHAR(8) NOT NULL,
  idVendedor INTEGER NOT NULL,
  idPrograma INTEGER NOT NULL,
  MontoFinalVenta DECIMAL (10,2),
  
  CONSTRAINT fk_ventas_programa_vendedor FOREIGN KEY (idVendedor) REFERENCES vendedor (idVendedor)
);

INSERT INTO ventas_programa VALUES 	(1,"23423442",1,1,450),
									(2,"23423525",2,2,350),
                                    (3,"34534573",3,3,550),
                                    (4,"34534576",3,4,599),
                                    (5,"34534634",2,5,300),
                                    (6,"34634636",1,6,800),
                                    (7,"34636567",1,7,500),
                                    (8,"45645647",3,6,700),
                                    (9,"45646647",2,5,300),
                                    (10,"45647836",1,3,450),
                                    (11,"76565434",2,1,430),
                                    (12,"56756776",3,2,350),
                                    (13,"65756756",1,5,300);
                                    
                                    
