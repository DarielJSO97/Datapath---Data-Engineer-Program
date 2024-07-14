-- Crear la base de datos solo si no existe
CREATE DATABASE IF NOT EXISTS db_movies_awards;

-- Usar la base de datos
USE db_movies_awards;

-- Crear las tablas
CREATE TABLE IF NOT EXISTS dim_movie (
    movieID INT PRIMARY KEY NOT NULL,
    awardID VARCHAR(100) NOT NULL,
    award VARCHAR(50) NOT NULL
);

CREATE TABLE IF NOT EXISTS dim_user (
    userID INT PRIMARY KEY NOT NULL,
    user_name VARCHAR(50) NOT NULL,
    country VARCHAR(50) NOT NULL,
    subscription VARCHAR(50) NOT NULL
);

CREATE TABLE IF NOT EXISTS participants (
    participantID INT PRIMARY KEY NOT NULL,
    participant_name VARCHAR(50) NOT NULL
);
