 -- HW 4: Task 1 - Pets Database Definition

-- Drop the database if it already exists
DROP DATABASE IF EXISTS pet_database;

-- Create the database
CREATE DATABASE pet_database;

-- Use the created database
USE pet_database;

-- Drop tables if they already exist
DROP TABLE IF EXISTS petPet, petEvent;

-- Create the petPet table
CREATE TABLE petPet (
    petname VARCHAR(20) NOT NULL,
    owner VARCHAR(45),
    species VARCHAR(45),  -- species is a general string, not restricted to 'M' or 'F'
    gender CHAR(1) CHECK (gender IN ('M', 'F')),  -- M or F for gender
    birth DATE,
    death DATE,
    PRIMARY KEY (petname)  -- petname as the primary key
);

-- Create the petEvent table
CREATE TABLE petEvent (
    petname VARCHAR(20) NOT NULL,
    eventdate DATE,
    eventtype VARCHAR(15),
    remark VARCHAR(255),
    FOREIGN KEY (petname) REFERENCES petPet(petname) ON DELETE CASCADE,  -- foreign key referencing petPet
    PRIMARY KEY (petname, eventdate)  -- composite primary key on petname and eventdate
);