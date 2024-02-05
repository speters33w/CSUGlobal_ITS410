DROP DATABASE IF EXISTS movies;
CREATE DATABASE movies;

USE movies;

CREATE TABLE movies_basic(
    id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    title VARCHAR(100),
    genre VARCHAR(20),
    release_year INT,
    director VARCHAR(40),
    studio VARCHAR(30),
    critic_rating DECIMAL(2,1) DEFAULT 0
);
