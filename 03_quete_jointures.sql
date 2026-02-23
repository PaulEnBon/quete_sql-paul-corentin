SELECT l.id_location, l.date_debut, l.date_fin, c.nom, c.prenom
FROM location l
JOIN client c ON l.id_client = c.id_client;

SELECT l.id_location, l.date_debut, l.date_fin, v.marque, v.modele
FROM location l
JOIN vehicule v ON l.id_vehicule = v.id_vehicule;

SELECT 
    l.id_location, 
    s_dep.nom AS station_depart, 
    s_arr.nom AS station_arrivee
FROM location l
JOIN station s_dep ON l.id_station_depart = s_dep.id_station
JOIN station s_arr ON l.id_station_arrivee = s_arr.id_station;