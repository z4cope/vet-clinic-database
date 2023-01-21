/* Database schema to keep the structure of entire database. */

CREATE TABLE animals(
	id SERIAL PRIMARY KEY,
	name VARCHAR(50),
	date_of_birth DATE,
	escape_attempts INT,
	neutered BOOLEAN,
	weight_kg DECIMAL
);

-- Day 3 task

ALTER TABLE animals ADD COLUMN species TEXT;

CREATE TABLE owners(
 	id SERIAL PRIMARY KEY,
 	full_name TEXT,
 	age INT
);

CREATE TABLE species(
	id SERIAL PRIMARY KEY,
	name TEXT
);

ALTER TABLE animals DROP COLUMN species;

ALTER TABLE animals ADD COLUMN species_id INT;

ALTER TABLE animals 
	ADD CONSTRAINT f_key_species FOREIGN KEY (species_id)
		REFERENCES species(id);

UPDATE animals SET species_id = (SELECT id FROM species WHERE name = 'Digimon') WHERE RIGHT(name, 3) = 'mon';

UPDATE animals SET species_id = (SELECT id FROM species WHERE name = 'Pokemon') WHERE species_id IS NULL;

ALTER TABLE animals ADD owner_id INT;

ALTER TABLE animals 
	ADD CONSTRAINT f_key_owners FOREIGN KEY (owner_id)
		REFERENCES owners(id);

