<?php

namespace Controllers;

require_once('libraries/models/Ressource.php');
require_once('libraries/Renderer.php');
require_once('libraries/Http.php');


class RessourceController
{
    protected $model;
    // protected $categorieModel;
    // protected $categorie;

    public function __construct()
    {
        $this->model = new \Models\Ressource();
        // $this->categorieModel = new \Models\Categorie();
    }
    
    // Montrer la liste
    public function index()
    {
        /**
         * 2. Récupération des ressource
         */
        $ressources = $this->model->findRessourceDetails();
        
        /**
         * 3. Affichage
         */
        $pageTitre = "Accueil";
        // $categorieModel = new \Models\Categorie();
        // $categorie = $categorieModel->libelle;
        \Renderer::render('ressources/index', compact('pageTitre', 'ressources'));
    }

    // Montrer UNE ressource
    public function show()
    {
        // $categorieModel = new \Models\Categorie();
        /**
         * 1. Récupération du param "id" et vérification de celui-ci
         */
        // On part du principe qu'on ne possède pas de param "id"
        $ressource_id = null;

        // Mais si il y'en a un et que c'est un nombre entier, alors c'est cool
        if (!empty($_GET['id']) && ctype_digit($_GET['id'])) {
            $ressource_id = $_GET['id'];
        }

        // On peut désormais décider : erreur ou pas ?!
        if (!$ressource_id) {
            die("Vous devez préciser un paramètre `id` dans l'URL !");
        }

        /**
         * 3. Récupération de la ressource en question
         * On va ici utiliser une requête préparée car elle inclue une variable qui provient de l'utilisateur
         */
        $ressource = $this->model->find($ressource_id);
        // $categorie = $this->model->findCategory($ressource_id);
        
        // $categorie = $categorieModel->find($ressource_id);

        /**
         * 5. On affiche 
         */
        $pageTitre = $ressource['titre'];

        // fonctions compact permet de créer un tableau associatif à partir du nom de variable qu'on met dedans. Les clés et les valeur ont le même contenu grâce à cette fonction. Ceux nom variables sont envoyés dans la fonction rendre et elles seront extraites sous en forme des véritables variables dans la fonction extract
        \Renderer::render('ressources/show', compact('pageTitre', 'ressource', 'ressource_id'));
    }

    // Supprimer une ressource
    public function delete()
    {
        /**
         * 1. On vérifie que le GET possède bien un paramètre "id" (delete.php?id=202) et que c'est bien un nombre
         */
        if (empty($_GET['id']) || !ctype_digit($_GET['id'])) {
            die("Ho ?! Tu n'as pas précisé l'id de la ressource !");
        }

        $id = $_GET['id'];

        /**
         * 3. Vérification que la ressource existe bel et bien
         */
        $ressource = $this->model->find($id);
        if (!$ressource) {
            die("La ressource $id n'existe pas, vous ne pouvez donc pas le supprimer !");
        }

        /**
         * 4. Réelle suppression de la ressource
         */
        $this->model->delete($id);

        /**
         * 5. Redirection vers la page d'accueil
         */
        \Http::redirect("index.php");
    }    
    
    // Modifier une ressource
    public function modify()
    {
        /**
         * 1. On vérifie que le GET possède bien un paramètre "id" (delete.php?id=202) et que c'est bien un nombre
         */
        if (empty($_GET['id']) || !ctype_digit($_GET['id'])) {
            die("Ho ?! Tu n'as pas précisé l'id de la ressource !");
        }

        $id = $_GET['id'];

        /**
         * 3. Vérification que la ressource existe bel et bien
         */
        $ressource = $this->model->find($id);
        if (!$ressource) {
            die("La ressource $id n'existe pas, vous ne pouvez donc pas le supprimer !");
        }

        /**
         * 4. Réelle modification de la ressource
         */
        $this->model->modify($id);

        /**
         * 5. Redirection vers la page d'accueil
         */
        \Http::redirect("index.php");
    }
}
