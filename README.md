🏗️ Projet SQL : clAra Mobility - Système de Gestion de Locations
👥 Présentation du Binôme
Membre 1 : [Votre Nom]

Membre 2 : [Nom de votre binôme]

Promotion : B1

Date : Février 2026

📖 A. Organisation du travail
Méthodologie
Nous avons opté pour une approche de Pair Programming (programmation en binôme) pour les requêtes les plus complexes (Quêtes 4 et 5) afin de s'assurer que la logique de jointure soit comprise par nous deux. Pour les tâches de base, nous avons réparti le travail par quêtes, tout en effectuant une revue de code mutuelle après chaque étape.

Gestion de version (Git/GitHub)
Flux de travail : Un commit a été effectué après chaque quête validée avec un message explicite (ex: feat: finalisation de la quête 3 sur les agrégations).

Synchronisation : Utilisation de GitHub pour centraliser le code, permettant d'éviter les pertes de données et de garder un historique clair de l'avancement.

Environnement de travail
SGBD : PostgreSQL (via pgAdmin 4).

Éditeur : Visual Studio Code pour la rédaction du Markdown et l'organisation des scripts .sql.

📊 B. Analyse du Modèle de Données (MCD)
Structure et Relations
La base de données repose sur 4 tables interconnectées :

vehicule : Référence le parc (voitures, scooters, vélos). Clé primaire : id_vehicule.

station : Points d'ancrage géographiques. Clé primaire : id_station.

client : Informations utilisateurs. Clé primaire : id_client.

location : Table centrale (fait) qui lie les trois autres. Elle utilise des clés étrangères :

id_client -> client(id_client)

id_vehicule -> vehicule(id_vehicule)

id_station_depart / id_station_arrivee -> station(id_station)

Pertinence Métier
Cette structuration permet à clAra Mobility de suivre en temps réel :

Le taux d'utilisation de chaque véhicule.

Les flux entre les villes (grâce aux stations de départ et d'arrivée).

Le comportement de location des clients (fréquence, durée).

💻 C. Choix Techniques et Syntaxe SQL
Stratégie de requête
Pour répondre aux besoins métiers, nous avons suivi une logique de décomposition :

Identifier les tables contenant les informations nécessaires.

Établir les liens via des JOIN.

Appliquer les filtres (WHERE) puis les calculs (SUM, AVG, COUNT).

Justification des commandes
INNER JOIN vs LEFT JOIN : Nous avons privilégié l'INNER JOIN pour les rapports d'activité afin de ne garder que les données complètes (ex: véhicules ayant déjà eu au moins une location).

GROUP BY & HAVING : Utilisés pour segmenter les données par ville ou par catégorie de véhicule, le HAVING nous a permis de filtrer les résultats après calcul (ex: villes ayant plus de X véhicules).

ORDER BY : Systématiquement utilisé pour rendre les résultats lisibles par les décideurs de l'entreprise.

⚠️ D. Difficultés rencontrées et Solutions
Gestion des dates : Le calcul de la durée des locations a nécessité l'utilisation de fonctions spécifiques aux TIMESTAMP. Nous avons appris à manipuler les intervalles de temps pour obtenir des résultats en minutes/heures.

Clés étrangères : Lors de l'insertion de données de test, nous avons dû respecter l'ordre de création des tables (on ne peut pas louer un véhicule qui n'existe pas encore dans la table vehicule).

Jointures multiples : Relier la table location à la table station deux fois (pour le départ et pour l'arrivée) a été un défi résolu par l'utilisation d'alias de table (station AS s_depart, station AS s_arrivee).

🚀 Comment utiliser ce projet ?
Exécutez le script Table-manquantes.sql pour créer la structure.

Importez les données du fichier vehicules_cIAra_2025.csv (attention à bien mapper les colonnes).

Lancez les scripts des quêtes dans l'ordre numérique.