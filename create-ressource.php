<?php

/**
 * DANS CE FICHIER, ON CHERCHE A SUPPRIMER la ressource DONT L'ID EST PASSE EN GET
 * 
 * Il va donc falloir bien s'assurer qu'un paramètre "id" est bien passé en GET, puis que cette ressource existe bel et bien
 * Ensuite, on va pouvoir effectivement supprimer la ressource et rediriger vers la page d'accueil
 */
require_once('libraries/controllers/RessourceController.php');

$controller = new \Controllers\RessourceController();
$controller->create();

