psql --username=freecodecamp --dbname=postgres
CREATE universe;
\c universe;

CREATE TABLE galaxy();
ALTER TABLE galaxy ADD COLUMN galaxy_id NUMERIC PRIMARY KEY UNIQUE NOT NULL;
ALTER TABLE galaxy ADD COLUMN name VARCHAR(20) NOT NULL;
ALTER TABLE galaxy ADD COLUMN galaxy_type TEXT;
ALTER TABLE galaxy ADD COLUMN mass_of_the_star INT;
ALTER TABLE galaxy ADD COLUMN description TEXT;

INSERT INTO galaxy(galaxy_id, name, galaxy_type, mass_of_the_star, description) VALUES (1, 'Andromeda', 'A', 20, 'Good'), (2, 'Cartwheel', 'A', 21, 'Cute'), (3, 'Sunflower', 'B', 25, 'Great'), (4, 'Milky Way', 'B', 35, 'Kinda'), (5, 'Whirlpool', 'C', 44, 'Awesome'), (6, 'Sombrero', 'E', 42, 'Thrilling');

CREATE TABLE star();
ALTER TABLE star ADD COLUMN star_id NUMERIC PRIMARY KEY UNIQUE NOT NULL;
ALTER TABLE star ADD COLUMN name VARCHAR(20) NOT NULL;
ALTER TABLE star ADD COLUMN core_temperature INT;
ALTER TABLE star ADD COLUMN age_in_my INT;
ALTER TABLE star ADD COLUMN galaxy_id NUMERIC;
ALTER TABLE star ADD FOREIGN KEY (galaxy_id) REFERENCES galaxy(galaxy_id);

INSERT INTO star(star_id, name, core_temperature, age_in_my, galaxy_id) VALUES (1, 'Castor', 12, 2, 4), (2, 'Orion', 13, 3, 3), (3, 'Sirius', 15, 2.1, 2), (4, 'Altar', 8, 4.7, 2), (5, 'Sun', 11, 1.8, 4), (6, 'Antares', 34, 1.3, 5);

CREATE TABLE planet();
ALTER TABLE planet ADD COLUMN planet_id NUMERIC PRIMARY KEY;
ALTER TABLE planet ADD COLUMN name VARCHAR(20) NOT NULL;
ALTER TABLE planet ADD COLUMN diameter_in_km INT UNIQUE NOT NULL;
ALTER TABLE planet ADD COLUMN has_life BOOLEAN;
ALTER TABLE planet ADD COLUMN star_id NUMERIC;
ALTER TABLE planet ADD FOREIGN KEY (star_id) REFERENCES star(star_id);

INSERT INTO planet(planet_id, name, diameter_in_km, has_life, star_id) VALUES (1, 'Mercury', 2, False, 5), (2, 'Venus', 3, False, 5), (3, 'Earth', 4, False, 5), (4, 'Mars', 7, True, 5),(5, 'Jupiter', 4.7, True, 5), (6, 'Saturn', 9, False, 5), (7, 'Uranus', 12, True, 4), (8, 'Neptune', 8, True, 4), (9, 'Pluto', 6, False, 1), (10, 'Eris', 10, False, 1), (11, 'Makemake', 13, False, 2), (12, 'Haumer', 11, True, 6);

CREATE TABLE moon();
ALTER TABLE moon ADD COLUMN moon_id NUMERIC PRIMARY KEY;
ALTER TABLE moon ADD COLUMN name VARCHAR(20) UNIQUE NOT NULL;
ALTER TABLE moon ADD COLUMN spherical_shape BOOLEAN NOT NULL;
ALTER TABLE moon ADD COLUMN discovery DATE;
ALTER TABLE moon ADD COLUMN planet_id NUMERIC;
ALTER TABLE moon ADD FOREIGN KEY (planet_id) REFERENCES planet(planet_id);

INSERT INTO moon(moon_id, name, spherical_shape, discovery, planet_id) VALUES (1, 'Luna', True, NULL, 3), (2, 'Phobos', False, '1941-02-11', 4), (3, 'Deimos', False, '2001-11-11', 4), (4, 'Callisto', True, '1941-04-11', 5), (5, 'Ganymede', True, '1940-01-11', 5), (6, 'Io', True, '1952-02-02', 5), (7, 'Europa', True, '1984-11-13', 5);
INSERT INTO moon(moon_id, name, spherical_shape, discovery, planet_id) VALUES (8, 'Titan', True, '1941-04-11', 6), (9, 'Rhea', True, '1940-01-11', 6), (10, 'Iapetus', False, '1952-02-02', 6), (11, 'Tethys', True, '1984-11-13', 6), (12, 'Mimas', True, '1941-04-11', 6), (13, 'Janus', False, '1940-01-11', 6), (14, 'Ymir', False, '1952-02-02', 6), (15, 'Ariel', True, '1984-11-13', 7);
INSERT INTO moon(moon_id, name, spherical_shape, discovery, planet_id) VALUES (16, 'Miranda', False, '1941-04-11', 7), (17, 'Cupid', False, '1940-01-11', 7), (18, 'Titana', True, '1952-02-02', 7), (19, 'Proteus', False, '1984-11-13', 8), (20, 'Nix', False, '1940-01-16', 9);

CREATE TABLE rocket();

ALTER TABLE rocket ADD COLUMN rocket_id NUMERIC UNIQUE NOT NULL;
ALTER TABLE rocket ADD PRIMARY KEY (rocket_id);
ALTER TABLE rocket ADD COLUMN name VARCHAR(20) NOT NULL;
ALTER TABLE rocket ADD COLUMN destination VARCHAR(40);
ALTER TABLE rocket ADD COLUMN mission_date DATE;
ALTER TABLE rocket ADD COLUMN moon_id NUMERIC;
ALTER TABLE rocket ADD FOREIGN KEY  (moon_id) REFERENCES moon(moon_id);

INSERT INTO rocket(rocket_id, name, destination, mission_date, moon_id) VALUES (1, 'S1', 'Luna', '1968-12-21', 1), (2, 'T1', 'Titan', '1969-12-24', 8), (3, 'S13', 'Janus', '1993-12-28', 13);

\s universe.sql
