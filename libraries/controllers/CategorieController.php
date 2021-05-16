<?php

namespace Controllers;

require_once('libraries/models/Categorie.php');
require_once('libraries/Renderer.php');
require_once('libraries/Http.php');


class CategorieController
{
    protected $model;

    public function __construct()
    {
        $this->model = new \Models\Categorie();
    }

    // Montrer la liste
    public function index()
    {
        /**
         * 2. Récupération des categories
         */
        $categories = $this->model->findAll();
    }

    // Montrer UN categorie
    public function show()
    {
        /**
         * 1. Récupération du param "id" et vérification de celui-ci
         */
        // On part du principe qu'on ne possède pas de param "id"
        $categorie_id = null;

        // Mais si il y'en a un et que c'est un nombre entier, alors c'est cool
        if (!empty($_GET['id']) && ctype_digit($_GET['id'])) {
            $categorie_id = $_GET['id'];
        }

        // On peut désormais décider : erreur ou pas ?!
        if (!$categorie_id) {
            die("Vous devez préciser un paramètre `id` dans l'URL !");
        }

        /**
         * 3. Récupération du categorie en question
         * On va ici utiliser une requête préparée car elle inclue une variable qui provient de l'utilisateur
         */
        $categorie = $this->model->find($categorie_id);
    }
}
