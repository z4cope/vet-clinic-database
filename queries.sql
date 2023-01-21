/*Queries that provide answers to the questions from all projects.*/

SELECT * FROM animals WHERE RIGHT(name,3) = 'mon';
SELECT * FROM animals WHERE date_of_birth BETWEEN '2016-1-1' AND '2019-1-1';
SELECT * FROM animals WHERE escape_attempts < 3;
SELECT date_of_birth FROM animals WHERE name = 'Agumon' OR name = 'Pikachu';
SELECT name, escape_attempts FROM animals WHERE weight_kg > 10.5;
SELECT * FROM animals WHERE neutered = TRUE;
SELECT * FROM animals WHERE name != 'Gabumon';
SELECT * FROM animals WHERE weight_kg >= 10.4 AND weight_kg <= 17.3;

--

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

--

SELECT COUNT(*) FROM animals;
SELECT COUNT(*) FROM animals WHERE escape_attempts = 0;
SELECT AVG(weight_kg) FROM animals;
SELECT neutered, max(escape_attempts) as "Most escapes" FROM animals GROUP BY neutered;
SELECT MAX(weight_kg), MIN(weight_kg) FROM animals GROUP BY species;
SELECT AVG(escape_attempts) FROM animals GROUP BY species WHERE date_of_birth BETWEEN '1990-1-1' AND '2000-1-1';

--

SELECT animals.name, owners.full_name FROM owners JOIN animals ON animals.owner_id = owners.id WHERE owners.id = 4;

SELECT animals.name, species.name FROM animals JOIN species ON animals.species_id = species.id WHERE species_id = 1;

SELECT * FROM owners LEFT JOIN animals ON owners.id = animals.owner_id; 

SELECT species.name, count(*) FROM animals JOIN species ON animals.species_id = species.id WHERE species.id IN (1,2) GROUP BY species.name;

SELECT animals.name, owners.full_name FROM animals JOIN owners ON animals.owner_id = owners.id WHERE owners.id = 2 AND animals.species_id = 2;

SELECT name FROM animals JOIN owners ON animals.species_id = owners.id WHERE owners.full_name = 'Dean Winchester' AND animals.escape_attempts = 0;

SELECT owners.full_name, count(animals.name) FROM owners JOIN animals ON owners.id = animals.owner_id GROUP BY owners.full_name ORDER BY count(animals.name) DESC LIMIT 1;
