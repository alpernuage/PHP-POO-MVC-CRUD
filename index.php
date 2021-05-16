<?php

/**
 * CE FICHIER A POUR BUT D'AFFICHER LA PAGE D'ACCUEIL !
 * 
 * On va donc se connecter à la base de données, récupérer les ressource du plus récent au plus ancien (SELECT * FROM ressource ORDER BY date_creation DESC)
 * puis on va boucler dessus pour afficher chacun d'entre eux
 */
require_once('libraries/controllers/RessourceController.php');

$controller = new \Controllers\RessourceController();
$controller->index();