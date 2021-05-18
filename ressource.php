<?php

/**
 * CE FICHIER DOIT AFFICHER UN ressource !
 * 
 * On doit d'abord récupérer le paramètre "id" qui sera présent en GET et vérifier son existence
 * Si on n'a pas de param "id", alors on affiche un message d'erreur !
 * 
 */
require_once('libraries/controllers/RessourceController.php');

$controller = new \Controllers\RessourceController();
$controller->show();