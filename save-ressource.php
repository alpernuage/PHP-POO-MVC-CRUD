<?php

/**
 * CE FICHIER DOIT ENREGISTRER UN NOUVEAU COMMENTAIRE EST REDIRIGER SUR la ressource !
 * 
 * On doit d'abord vérifier que toutes les informations ont été entrées dans le formulaire
 * Si ce n'est pas le cas : un message d'erreur
 * Sinon, on va sauver les informations
 * 
 * Pour sauvegarder les informations, ce serait bien qu'on soit sur que la ressource qu'on essaye de commenter existe
 * Il faudra donc faire une première requête pour s'assurer que la ressource existe
 * Ensuite on pourra intégrer le commentaire
 * 
 * Et enfin on pourra rediriger l'utilisateur vers la ressource en question
 */
require_once('libraries/controllers/RessourceController.php');

$controller = new \Controllers\RessourceController();
// $controller->insert();