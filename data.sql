/* Populate database with sample data. */

INSERT INTO animals(name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES('Agumon', '2020-2-3', 0, TRUE, 10.23);
INSERT INTO animals(name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES('Gabumon', '2018-11-15', 2, TRUE, 8);
INSERT INTO animals(name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES('Pikachu', '2021-6-12', 1, FALSE, 15.04);
INSERT INTO animals(name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES('Devimon', '2017-5-12', 5, TRUE, 11);

--

INSERT INTO animals(name, date_of_birth, weight_kg, neutered, escape_attempts) VALUES('Charmander', '2020-2-8', -11, FALSE, 0);
INSERT INTO animals(name, date_of_birth, weight_kg, neutered, escape_attempts) VALUES('Plantmon', '2021-11-15', -5.7, TRUE, 2);
INSERT INTO animals(name, date_of_birth, weight_kg, neutered, escape_attempts) VALUES('Squirtle', '1993-4-2', -12.13, FALSE, 3);
INSERT INTO animals(name, date_of_birth, weight_kg, neutered, escape_attempts) VALUES('Angemon', '2005-6-12', -45, FALSE, 1);
INSERT INTO animals(name, date_of_birth, weight_kg, neutered, escape_attempts) VALUES('Boarmon', '2005-6-7', 20.4, FALSE, 7);
INSERT INTO animals(name, date_of_birth, weight_kg, neutered, escape_attempts) VALUES('Blossom', '1992-10-13', 17, TRUE, 3);
INSERT INTO animals(name, date_of_birth, weight_kg, neutered, escape_attempts) VALUES('Ditto', '2022-5-14', 22, FALSE, 4);

--

UPDATE animals SET owner_id =  (SELECT id FROM owners WHERE full_name = 'Sam Smith') WHERE name = 'Agumon';
UPDATE animals SET owner_id =  (SELECT id FROM owners WHERE full_name = 'Jennifer Orwell') WHERE name IN ('Pikachu','Gabumon');
UPDATE animals SET owner_id =  (SELECT id FROM owners WHERE full_name = 'Bob') WHERE name IN ('Devimon','Plantmon');
UPDATE animals SET owner_id =  (SELECT id FROM owners WHERE full_name = 'Melody Pond') WHERE name IN ('Charmander', 'Squirtle', 'Blossom');
UPDATE animals SET owner_id =  (SELECT id FROM owners WHERE full_name = 'Dean Winchester') WHERE name IN ('Angemon', 'Boarmon');

-- day-4

INSERT INTO vets(name,age,date_of_graduation)
VALUES
('William Tatcher',45, '2000-04-23'),
('Maisy Smith',26,'2019-01-17'),
('Stephanie Mendez',64,'1981-05-04'),
('Jack Harkness',38,'2008-06-08');


INSERT INTO specializations (species_id, vets_id)
VALUES
(1,1),
(1,3),
(2,3),
(2,4);

INSERT INTO visits (animals_id,vets_id,visit_date)
VALUES
(1,1,'2020-05-24'),
(1,3,'2020-07-22'),
(2,4,'2021-02-02'),
(3,2,'2020-01-05'),
(3,2,'2020-03-08'),
(3,2,'2020-05-14'),
(4,3,'2021-05-04'),
(5,4,'2021-02-24'),
(6,2,'2019-12-21'),
(6,1,'2020-08-10'),
(6,2,'2021-04-07'),
(7,3,'2019-09-29'),
(8,4,'2020-10-03'),
(8,4,'2020-11-04'),
(9,2,'2019-01-24'),
(9,2,'2019-05-15'),
(9,2,'2020-02-27'),
(9,2,'2020-08-03'),
(10,3,'2021-01-11');



