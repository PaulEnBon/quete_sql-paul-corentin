
SELECT * FROM vehicule 
WHERE etat = 'Disponible' 
ORDER BY autonomie_km DESC 
LIMIT 3;

SELECT ville, COUNT(*) AS nb_vehicules_dispo
FROM vehicule 
WHERE etat = 'Disponible' 
GROUP BY ville 
ORDER BY nb_vehicules_dispo DESC 
LIMIT 1;

SELECT c.nom, c.prenom, COUNT(l.id_location) AS total_locations
FROM client c
JOIN location l ON c.id_client = l.id_client
GROUP BY c.id_client, c.nom, c.prenom
HAVING COUNT(l.id_location) >= 2;

SELECT v.id_vehicule, v.marque, v.modele
FROM vehicule v
LEFT JOIN location l ON v.id_vehicule = l.id_vehicule
WHERE l.id_location IS NULL;