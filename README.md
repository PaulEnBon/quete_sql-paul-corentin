# Projet SQL B1 - cIAra Mobility

**Membres du binôme :** Paul Bourdareau Launay & Corentin Nokaya
**Date de rendu :** 25 Février 2026 
## Rapport d'Analyse Technique

### A. Organisation du travail en binôme
* **Méthodologie :** Nous avons adopté une approche collaborative. Les quêtes de découverte (1 et 2) ont été réparties individuellement pour se familiariser avec la base, tandis que les requêtes complexes (quêtes 3, 4 et 5) ont été réalisées en "Pair Programming" (programmation en binôme) pour croiser nos logiques.
* **Gestion de version (Git/GitHub) :** Nous avons travaillé sur un dépôt commun avec des commits réguliers à chaque étape validée (ex: "ajout des requêtes de la quête 3").
* **Environnement de travail :** Nous avons utilisé PostgreSQL comme SGBD principal et pgAdmin pour exécuter et visualiser le résultat de nos requêtes avant de les sauvegarder dans les scripts SQL.

### B. Analyse du Modèle de Données (MCD)
***Structure de la base :** La base de données est composée de 4 tables (vehicule, station, client, location).
* **Relations :** * La table `location` agit comme une table de liaison centrale. Elle contient des clés étrangères pointant vers `client` (qui a loué), `vehicule` (quel véhicule), et `station` (d'où il part et où il arrive) .
* **Pertinence :** Cette structure en étoile permet à cIAra Mobility de suivre précisément l'état de sa flotte et l'historique de ses utilisateurs sans dupliquer les informations (par exemple, on ne stocke pas le nom du client dans la table location, juste son ID).

### C. Choix Techniques et Syntaxe SQL
* **Stratégie de requête :** Nous avons construit nos requêtes de manière incrémentale, en validant d'abord les `SELECT` et les `JOIN` avant d'ajouter les filtres (`WHERE`) et les agrégations (`GROUP BY`).
* **Justification des commandes :**
  * **Quête 3 (Jointures) :** Pour afficher la station de départ et d'arrivée, il a fallu faire deux `JOIN` sur la même table `station`. Nous avons utilisé des alias (`s_dep` et `s_arr`) pour différencier les deux rôles.
  ***Quête 5 (Cas métier) :** L'utilisation de `HAVING` était indispensable pour filtrer les clients ayant au moins deux locations, car le filtre devait s'appliquer *après* le comptage (`COUNT`) des locations.
* **Logique de filtrage :** Pour les véhicules "n'ayant jamais été loués", nous avons utilisé un `LEFT JOIN` de la table véhicule vers la table location, en cherchant les enregistrements où l'ID de location est `NULL` (inexistant).

### D. Difficultés rencontrées et Solutions
* **Gérer les doubles jointures :** Relier la table location à la table station pour deux colonnes différentes (`id_station_depart` et `id_station_arrivee`) a généré des erreurs au début. *Solution :* L'utilisation stricte des alias a permis de résoudre ce problème.
* **Cohérence des données :** Le fichier CSV fourni pour la veille présentait des colonnes légèrement différentes du schéma PDF (ex: "localisation" au lieu de "ville"). *Solution :* Nous nous sommes fiés strictement au schéma fourni dans le PDF de présentation du projet pour écrire nos requêtes .