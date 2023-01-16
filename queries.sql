/*Queries that provide answers to the questions from all projects.*/

SELECT * FROM vet_clinic WHERE name LIKE '%mon%';
SELECT * FROM vet_clinic WHERE date_of_birth BETWEEN '2016-1-1' AND '2019-1-1';
SELECT * FROM vet_clinic WHERE escape_attempts < 3;
SELECT date_of_birth FROM vet_clinic WHERE name = 'Agumon' OR name = 'Pikachu';
SELECT name, escape_attempts FROM vet_clinic WHERE weight_kg > 10.5;
SELECT * FROM vet_clinic WHERE neutered = TRUE;
SELECT * FROM vet_clinic WHERE name != 'Gabumon';
SELECT * FROM vet_clinic WHERE weight_kg <= 10.4 AND weight_kg <= 17.3;
