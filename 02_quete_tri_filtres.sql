SELECT c.nom, c.prenom, v.modele, l.date_debut
FROM location l
JOIN client c ON l.id_client = c.id_client
JOIN vehicule v ON l.id_vehicule = v.id_vehicule;