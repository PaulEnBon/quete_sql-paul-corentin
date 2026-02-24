SELECT ville, COUNT(*) AS nombre_vehicules, AVG(autonomie_km) AS autonomie_moyenne
FROM vehicule
GROUP BY ville
HAVING COUNT(*) > 0;