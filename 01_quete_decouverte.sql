SELECT marque, modele, autonomie_km 
FROM vehicule 
WHERE etat = 'disponible' 
ORDER BY autonomie_km DESC;