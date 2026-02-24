-- TABLE vehicule
CREATE TABLE vehicule (
    id_vehicule SERIAL PRIMARY KEY,
    marque VARCHAR(50),
    modele VARCHAR(50),
    type_vehicule VARCHAR(50),
    autonomie_km INTEGER,
    etat VARCHAR(30),
    ville VARCHAR(50)
);

INSERT INTO vehicule (marque, modele, type_vehicule, autonomie_km, etat, ville) VALUES
('Tesla', 'Model 3', 'Voiture', 491, 'disponible', 'Paris'),
('Renault', 'Zoé', 'Voiture', 395, 'loué', 'Lyon'),
('Peugeot', 'e-208', 'Voiture', 362, 'disponible', 'Marseille'),
('Xiaomi', 'Pro 2', 'Trottinette', 45, 'disponible', 'Paris'),
('NIU', 'NQi GTS', 'Scooter', 80, 'loué', 'Lyon'),
('VanMoof', 'S5', 'Vélo', 150, 'disponible', 'Bordeaux');


-- TABLE station
CREATE TABLE station (
    id_station SERIAL PRIMARY KEY,
    nom VARCHAR(100),
    ville VARCHAR(50)
);

INSERT INTO station (nom, ville) VALUES
('Gare du Nord', 'Paris'),
('Part-Dieu', 'Lyon'),
('Vieux-Port', 'Marseille'),
('Place de la Bourse', 'Bordeaux');


-- TABLE client
CREATE TABLE client (
    id_client SERIAL PRIMARY KEY,
    nom VARCHAR(50),
    prenom VARCHAR(50),
    email VARCHAR(100)
);

INSERT INTO client (nom, prenom, email) VALUES
('Dupont', 'Lucas', 'lucas.dupont@email.com'),
('Martin', 'Emma', 'emma.martin@email.com'),
('Bernard', 'Hugo', 'hugo.bernard@email.com'),
('Petit', 'Chloé', 'chloe.petit@email.com');


-- TABLE location
CREATE TABLE location (
    id_location SERIAL PRIMARY KEY,
    date_debut TIMESTAMP,
    date_fin TIMESTAMP,
    id_client INTEGER REFERENCES client(id_client),
    id_vehicule INTEGER REFERENCES vehicule(id_vehicule),
    id_station_depart INTEGER REFERENCES station(id_station),
    id_station_arrivee INTEGER REFERENCES station(id_station)
);

INSERT INTO location (date_debut, date_fin, id_client, id_vehicule, id_station_depart, id_station_arrivee) VALUES
('2026-01-10 08:00:00', '2026-01-10 10:00:00', 1, 1, 1, 1),
('2026-01-12 14:00:00', '2026-01-12 16:00:00', 2, 2, 2, 2),
('2026-01-15 09:30:00', '2026-01-15 11:00:00', 1, 3, 3, 3),
('2026-01-18 18:00:00', '2026-01-18 19:00:00', 3, 5, 2, 2);