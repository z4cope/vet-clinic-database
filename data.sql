/* Populate database with sample data. */

INSERT INTO animals(name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES('Agumon', '2020-2-3', 0, TRUE, 10.23);
INSERT INTO animals(name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES('Gabumon', '2018-11-15', 2, TRUE, 8);
INSERT INTO animals(name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES('Pikachu', '2021-6-12', 1, FALSE, 15.04);
INSERT INTO animals(name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES('Devimon', '2017-5-12', 5, TRUE, 11);

--

INSERT INTO animals(name, date_of_birth, weight_kg, neutered, escape_attempts) VALUES('Charmander', '2020-2-8', -11, FALSE, 0);
INSERT INTO animals(name, date_of_birth, weight_kg, neutered, escape_attempts) VALUES('Plantmon', '2021-8-15', -5.7, TRUE, 2);
INSERT INTO animals(name, date_of_birth, weight_kg, neutered, escape_attempts) VALUES('Squirtle', '1993-4-2', -12.13, FALSE, 3);
INSERT INTO animals(name, date_of_birth, weight_kg, neutered, escape_attempts) VALUES('Angemon', '2005-6-12', -45, FALSE, 1);
INSERT INTO animals(name, date_of_birth, weight_kg, neutered, escape_attempts) VALUES('Boarmon', '2005-6-7', 20.4, FALSE, 7);
INSERT INTO animals(name, date_of_birth, weight_kg, neutered, escape_attempts) VALUES('Blossom', '2020-10-13', 17, TRUE, 3);
INSERT INTO animals(name, date_of_birth, weight_kg, neutered, escape_attempts) VALUES('Ditto', '2022-5-14', 22, FALSE, 4);

BEGIN;
UPDATE animals SET species = 'unspecified';
ROLLBACK;

BEGIN;
UPDATE animals SET name = 'digimon' WHERE RIGHT(name,3) = 'mon';
ROLLBACK;

BEGIN;
UPDATE animals SET species = 'pokemon' WHERE species is NULL;
COMMIT;

BEGIN;
DELETE FROM animals;
ROLLBACK;

BEGIN;
DELETE FROM animals WHERE date_of_birth > '2022-1-1';
ROLLBACK;

BEGIN;
DELETE FROM animals WHERE date_of_birth > '2022-1-1';
SAVEPOINT sp1;
UPDATE animals SET weight_kg = weight_kg * -1;
ROLLBACK TO SAVEPOINT sp1;
UPDATE animals SET weight_kg = weight_kg * -1 WHERE weight_kg < 0;
COMMIT;

