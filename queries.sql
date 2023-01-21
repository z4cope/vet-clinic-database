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


-- day-4

SELECT
	animals.name AS animal_name
FROM
	visits
	JOIN animals ON animals.id = visits.animals_id
	JOIN vets ON vets.id = visits.vets_id
WHERE
	vets.id = 1
ORDER BY
	visits.visit_date DESC
LIMIT 1;

SELECT DISTINCT vets.name AS vet_name, animals.name AS animal_name 
FROM visits 
JOIN animals ON animals.id = visits.animal_id 
AND vet_id = (SELECT id FROM vets WHERE name = 'Stephanie Mendez')
JOIN vets ON vets.id = visits.vet_id;

SELECT
	vets.name AS vets_name,
	species.name
FROM
	vets
	LEFT JOIN specializations ON vets.id = specializations.vets_id
	LEFT JOIN species ON species.id = specializations.species_id;

SELECT vets.name AS vet_name, animals.name AS animal_name, date_of_visit
FROM visits
JOIN animals ON animals.id = visits.vet_id
JOIN vets ON vets.id = visits.vet_id AND vets.name = 'Stephanie Mendez' AND date_of_visit BETWEEN '04-01-2020' AND '08-30-2020';

SELECT
	animals.name,
	count(animals.name)
FROM
	animals
	JOIN visits ON animals.id = visits.animals_id
GROUP BY
	animals.name
ORDER BY
	count(animals.name) DESC
LIMIT 1;

SELECT
	animals.name,
	visits.visit_date
FROM
	animals
	JOIN visits ON animals.id = visits.animals_id
	JOIN vets ON vets.id = visits.vets_id
WHERE
	vets.id = 2
ORDER BY
	visits.visit_date ASC
LIMIT 1;

SELECT
	*
FROM
	animals
	JOIN visits ON animals.id = visits.animals_id
	JOIN vets ON vets.id = visits.vets_id
ORDER BY
	visits.visit_date DESC
LIMIT 1;

SELECT
	count(visits.id) AS count
FROM
	visits
	LEFT JOIN animals ON visits.animals_id = animals.id
	LEFT JOIN vets ON visits.vets_id = vets.id
	LEFT JOIN specializations ON specializations.species_id = animals.species_id
		AND specializations.vets_id = vets.id
WHERE
	specializations.species_id IS NULL;

SELECT
	species.name AS species
FROM
	animals
	JOIN visits ON animals.id = visits.animals_id
	JOIN vets ON vets.id = visits.vets_id
	JOIN species ON species.id = animals.species_id
WHERE
	vets.id = 2
GROUP BY
	species.name
ORDER BY
	count(species.name) DESC
LIMIT 1;
