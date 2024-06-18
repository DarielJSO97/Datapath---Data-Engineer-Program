USE academico_datapath;

## Creación de una vista para el programa de data analyst

DROP VIEW IF EXISTS view_data_analyst;
CREATE VIEW  view_data_analyst AS
SELECT descripcion, inversion FROM programa
WHERE LOWER(descripcion) LIKE "%data analyst%";

## creacion de una vista para el programa de data  engineering

CREATE VIEW view_data_engineering AS
SELECT descripcion, inversion FROM programa
WHERE LOWER(descripcion) LIKE "%data engineer%";


### Ejemplo de Procedimientos Almacenados

## Listas los programas que se desarrollan en un dia específico de la semana

DROP PROCEDURE IF EXISTS sp_programa_dia;
DELIMITER $$

CREATE PROCEDURE sp_programa_dia (IN dia_semana VARCHAR (50))
BEGIN 
	SELECT * FROM programa
	WHERE LOWER(horario_clases) LIKE CONCAT('%' ,LOWER(dia_semana) , '%');
END
$$

CALL sp_programa_dia("domingo");

  
## Funciones Ejemplos
## Funciones implícitas y explícitas

# Funciones de texto

SELECT LOWER("Hola") AS minuscula;

SELECT UPPER("hola") AS mayuscula;

SELECT LENGTH("Hola amigos del DAP6") AS saludo;

SELECT CONCAT("hola ", "amigos ","del ","DAP6") AS saludo;

# Funciones de número

SELECT ROUND(2.45232234234,6) AS numero_redondeado

SELECT ABS(-1234) AS valor_absoluto

SELECT LOG(10,100) AS log_base10_100

SELECT PI() AS pi

SELECT SQRT(4) as raiz_cuatro


# Funciones de Fecha

SELECT CURRENT_DATE() AS fecha_actual;

SELECT CURRENT_TIME() AS fecha_actual;


SELECT ADDDATE("2023-06-27", INTERVAL 5 DAY) as fecha_en_5_dias;

SELECT ADDDATE("2023-06-27", INTERVAL 1 MONTH) as fecha_en_1_mes;


SELECT DATEDIFF("2023-06-27", "2023-06-21") as diferencia_fechas;


SELECT DAY("2023-06-27") as dia;
SELECT MONTH("2023-06-27") as dia;
SELECT YEAR("2023-06-27") as dia;

SELECT EXTRACT(MONTH FROM "2017-06-15");


## FUNCIONES EXPLÍCITAS

## Crear una funcion que retorne el precio promedio de un programa (DAP, DEP, DS)
 DELIMITER $$
 CREATE FUNCTION precio_promedio( programa VARCHAR (30))
 RETURNS DOUBLE
 DETERMINISTIC
 BEGIN 
 
	IF programa="DAP"
			THEN 
				SET  @precio_promedio:= (SELECT AVG(inversion) FROM programa
                WHERE LOWER(descripcion) LIKE  "%data analyst%");
	ELSEIF (programa="DEP")
			THEN 
				SET @precio_promedio:= (SELECT AVG(inversion) FROM programa
                WHERE LOWER(descripcion) LIKE  "%data engineer%");
	ELSEIF (programa="DSP")
			THEN 
				SET @precio_promedio:= (SELECT AVG(inversion) FROM programa
                WHERE LOWER(descripcion) LIKE "%data scientist%");
    
	 END IF;
     
     RETURN (@precio_promedio);
 
 END;
 $$



SELECT precio_promedio("DSP");


## ETIQUETAR LOS PROGRAMAS DE ACUERDO A SU INVERSIÓN DE LA SIGUIENTE MANERA:
## SI EL PROGRAMA CUESTA MÁS DE 800, ETIQUETAR COMO PRECIO ALTO
## SI EL PROGRAMA CUESTA ENTRE 500 A 800, ETIQUETAR COMO PRECIO MEDIO
## SI EL PROGRAMA CUESTA MENOS QUE 500, ETIQUETAR COMO PRECIO BAJO



## CREAMOS UNA FUNCION DE ETIQUETADO
DROP FUNCTION IF EXISTS inversionCategoria;

DELIMITER $$

CREATE FUNCTION inversionCategoria(precio FLOAT)
RETURNS VARCHAR(30)
DETERMINISTIC

 BEGIN
	DECLARE categoria VARCHAR(30);
    
    IF precio >= 800 THEN SET categoria = "Precio Alto";
    
    ELSEIF (precio>=500 and precio <800 ) THEN SET categoria = "Precio Medio";
    
    ELSE SET categoria ="Precio bajo";
    END IF;
    
    RETURN categoria;
    
 
 END;

$$


SELECT inversionCategoria (400) as categoria;


SELECT descripcion, inversion, inversionCategoria(inversion) as inversionCategoria FROM programa;



SELECT descripcion, inversion,

CASE
	WHEN inversion >=800 THEN "precio alto"
    WHEN inversion >=500 and inversion <800 THEN  "precio medio"
    ELSE "precio bajo"
END AS inversionCategoria

FROM programa;







## Ejemplo de los TRIGGERS

## CREAR UNA TABLA donde se registren las acciones que se realizan en la tabla estudiante. 

CREATE DATABASE DB_LOGS;
USE DB_LOGS;

CREATE TABLE log_estudiante
(
	id INTEGER PRIMARY KEY NOT NULL AUTO_INCREMENT,
	accion VARCHAR (500) NOT NULL,
	fecha DATETIME DEFAULT CURRENT_TIMESTAMP
)



## CREAMOS EL TRIGGER  PARA CADA TUTOR

select * from tutor;

DROP TRIGGER IF EXISTS log_tutor;

USE ACADEMICO_DATAPATH;



DELIMITER $$

CREATE TRIGGER log_tutor AFTER INSERT ON tutor

FOR EACH ROW

BEGIN

	INSERT INTO DB_LOGS. `log_tutor`(accion) VALUES (CONCAT("Se insertó un nuevo tutor a la base de datos, y se llama : ", NEW.nombre));

END

$$


DROP TRIGGER IF EXISTS log_tutor_delete;


DELIMITER $$
CREATE TRIGGER log_tutor_delete AFTER DELETE ON tutor
FOR EACH ROW

BEGIN

INSERT INTO DB_LOGS. `log_tutor`(accion) VALUES (CONCAT("Se eliminó un tutor de la base de datos, y se llama : ", OLD.nombre));

END

$$






