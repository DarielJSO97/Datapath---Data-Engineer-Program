#creamos la base de datos para el modelo multidimensional
CREATE DATABASE dw_netflix;

##usamos la base de datos creada
USE dw_netflix;


/*creamos la tabla de dimMovie*/
CREATE TABLE dimMovie (
	movieID VARCHAR(8) PRIMARY KEY,
    title VARCHAR (100),
    releaseMovie DATE,
    gender VARCHAR(100),
    participantName VARCHAR(100),
    roleparticipant VARCHAR (100),
    awardMovie VARCHAR (20)
);


/*creamos la tabla de dimUser*/
CREATE TABLE dimUser (
	userID INTEGER PRIMARY KEY,
    username VARCHAR(50),
    country varchar(50)
);


/*creamos la tabla de FactVentas*/
CREATE TABLE FactWatchs (

	userID INTEGER,
    movieID VARCHAR(8),
    rating DECIMAL(2,1),
    timestamp  timestamp,
    
    /* CREANDO LAS REALACIONES*/
    CONSTRAINT fk_factwatchs_movie FOREIGN KEY (movieID) REFERENCES dimMovie (movieID),
	CONSTRAINT fk_factwatchs_user FOREIGN KEY (userID) REFERENCES dimUser (userID)

);

/* Create the dimPlatform table */
CREATE TABLE dimPlatform (
    platformId INTEGER PRIMARY KEY,
    platformName VARCHAR(50),
    platformCountry VARCHAR(50)
);

/* Updated FactWatchs table to include platformId */
CREATE TABLE FactWatchs (
    userID INTEGER,
    movieID VARCHAR(8),
    platformId INTEGER,
    rating DECIMAL(2,1),
    timestamp TIMESTAMP,
    
    /* CREATING THE RELATIONSHIPS */
    CONSTRAINT fk_factwatchs_movie FOREIGN KEY (movieID) REFERENCES dimMovie (movieID),
    CONSTRAINT fk_factwatchs_user FOREIGN KEY (userID) REFERENCES dimUser (userID),
    CONSTRAINT fk_factwatchs_platform FOREIGN KEY (platformId) REFERENCES dimPlatform (platformId)
);


/* Insert dummy data into dimMovie */
INSERT INTO dimMovie (movieID, title, releaseMovie, gender, participantName, roleparticipant, awardMovie) VALUES
('MOV00001', 'The Great Adventure', '2021-05-14', 'Action', 'John Doe', 'Director', 'Oscar'),
('MOV00002', 'Love in Paris', '2020-02-14', 'Romance', 'Jane Smith', 'Lead Actress', 'Golden Globe'),
('MOV00003', 'Mystery of the Unknown', '2019-10-31', 'Mystery', 'Tom Hanks', 'Lead Actor', 'BAFTA'),
('MOV00004', 'Comedy Nights', '2022-07-21', 'Comedy', 'Emma Stone', 'Supporting Actress', 'Emmy'),
('MOV00005', 'Sci-Fi Future', '2023-03-01', 'Science Fiction', 'Chris Evans', 'Producer', 'Saturn'),
('MOV00006', 'Historical Journey', '2018-11-22', 'Historical', 'Meryl Streep', 'Lead Actress', 'Oscar'),
('MOV00007', 'The Dark Truth', '2021-08-15', 'Thriller', 'Denzel Washington', 'Supporting Actor', 'Golden Globe'),
('MOV00008', 'Animated Dreams', '2020-12-25', 'Animation', 'Brad Pitt', 'Voice Actor', 'Annie'),
('MOV00009', 'Documentary Insights', '2019-06-20', 'Documentary', 'Ken Burns', 'Director', 'Emmy'),
('MOV00010', 'Fantasy World', '2023-09-10', 'Fantasy', 'Gal Gadot', 'Lead Actress', 'Saturn');

/* Insert dummy data into dimUser */
INSERT INTO dimUser (userID, username, country) VALUES
(1, 'john_doe', 'USA'),
(2, 'jane_smith', 'Canada'),
(3, 'tom_hanks', 'UK'),
(4, 'emma_stone', 'Australia'),
(5, 'chris_evans', 'USA'),
(6, 'meryl_streep', 'France'),
(7, 'denzel_washington', 'USA'),
(8, 'brad_pitt', 'Germany'),
(9, 'ken_burns', 'USA'),
(10, 'gal_gadot', 'Israel');



/* Insert dummy data into FactWatchs */
INSERT INTO FactWatchs (userID, movieID, rating, timestamp) VALUES
(1, 'MOV00001', 4.5, '2024-01-15 10:00:00'),
(2, 'MOV00002', 3.8, '2024-01-16 11:30:00'),
(3, 'MOV00003', 4.0, '2024-01-17 14:45:00'),
(4, 'MOV00004', 3.5, '2024-01-18 13:20:00'),
(5, 'MOV00005', 4.2, '2024-01-19 16:00:00'),
(6, 'MOV00006', 4.8, '2024-01-20 17:50:00'),
(7, 'MOV00007', 3.9, '2024-01-21 19:00:00'),
(8, 'MOV00008', 4.1, '2024-01-22 20:30:00'),
(9, 'MOV00009', 4.3, '2024-01-23 21:15:00'),
(10, 'MOV00010', 4.7, '2024-01-24 22:45:00'),
(1, 'MOV00002', 3.6, '2024-02-01 09:15:00'),
(2, 'MOV00003', 4.4, '2024-02-02 10:30:00'),
(3, 'MOV00004', 3.2, '2024-02-03 11:45:00'),
(4, 'MOV00005', 4.9, '2024-02-04 12:50:00'),
(5, 'MOV00006', 4.0, '2024-02-05 13:45:00'),
(6, 'MOV00007', 4.5, '2024-02-06 14:20:00'),
(7, 'MOV00008', 3.7, '2024-02-07 15:00:00'),
(8, 'MOV00009', 4.8, '2024-02-08 16:30:00'),
(9, 'MOV00010', 3.9, '2024-02-09 17:45:00'),
(10, 'MOV00001', 4.6, '2024-02-10 18:50:00');


/* Create the dimPlatform table */
CREATE TABLE dimPlatform (
    platformId INTEGER PRIMARY KEY,
    platformName VARCHAR(50),
    platformCountry VARCHAR(50)
);


/* Insert dummy data into dimPlatform */
INSERT INTO dimPlatform (platformId, platformName, platformCountry) VALUES
(1, 'Netflix', 'USA'),
(2, 'Amazon Prime', 'USA'),
(3, 'Disney+', 'USA'),
(4, 'Hulu', 'USA'),
(5, 'HBO Max', 'USA'),
(6, 'Apple TV+', 'USA'),
(7, 'BBC iPlayer', 'UK'),
(8, 'Crave', 'Canada'),
(9, 'Stan', 'Australia'),
(10, 'Hotstar', 'India');



/* Insert dummy data into FactWatchs */
INSERT INTO FactWatchs (userID, movieID, platformId, rating, timestamp) VALUES
(1, 'MOV00001', 1, 4.5, '2024-01-15 10:00:00'),
(2, 'MOV00002', 2, 3.8, '2024-01-16 11:30:00'),
(3, 'MOV00003', 3, 4.0, '2024-01-17 14:45:00'),
(4, 'MOV00004', 4, 3.5, '2024-01-18 13:20:00'),
(5, 'MOV00005', 5, 4.2, '2024-01-19 16:00:00'),
(6, 'MOV00006', 6, 4.8, '2024-01-20 17:50:00'),
(7, 'MOV00007', 7, 3.9, '2024-01-21 19:00:00'),
(8, 'MOV00008', 8, 4.1, '2024-01-22 20:30:00'),
(9, 'MOV00009', 9, 4.3, '2024-01-23 21:15:00'),
(10, 'MOV00010', 10, 4.7, '2024-01-24 22:45:00'),
(1, 'MOV00002', 2, 3.6, '2024-02-01 09:15:00'),
(2, 'MOV00003', 3, 4.4, '2024-02-02 10:30:00'),
(3, 'MOV00004', 4, 3.2, '2024-02-03 11:45:00'),
(4, 'MOV00005', 5, 4.9, '2024-02-04 12:50:00'),
(5, 'MOV00006', 6, 4.0, '2024-02-05 13:45:00'),
(6, 'MOV00007', 7, 4.5, '2024-02-06 14:20:00'),
(7, 'MOV00008', 8, 3.7, '2024-02-07 15:00:00'),
(8, 'MOV00009', 9, 4.8, '2024-02-08 16:30:00'),
(9, 'MOV00010', 10, 3.9, '2024-02-09 17:45:00'),
(10, 'MOV00001', 1, 4.6, '2024-02-10 18:50:00');
