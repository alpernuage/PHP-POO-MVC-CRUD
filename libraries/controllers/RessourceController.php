<?php

namespace Controllers;

require_once('libraries/models/Ressource.php');
require_once('libraries/Renderer.php');
require_once('libraries/Http.php');


class RessourceController
{
    protected $model;
    protected $message;

    public function __construct()
    {
        $this->model = new \Ressource();
    }

    // Montrer la liste des ressources
    public function index()
    {
        /**
         * 1. Récupération des ressources
         */
        $ressources = $this->model->findRessourceDetails();

        /**
         * 2. Affichage
         */
        $pageTitre = "Accueil";
        \Renderer::render('ressources/index', compact('pageTitre', 'ressources'));
    }

    // Montrer UNE ressource
    public function show()
    {
        /**
         * 1. Récupération du param "id" et vérification de celui-ci
         */
        // On part du principe qu'on ne possède pas de param "id"
        $ressource_id = null;

        // On controle si il y'en a un et que c'est un nombre entier
        if (!empty($_GET['id']) && ctype_digit($_GET['id'])) {
            $ressource_id = $_GET['id'];
        }

        // S'il n'y a pas de id une erreur s'affiche
        if (!$ressource_id) {
            die("Vous devez préciser un paramètre `id` dans l'URL !");
        }

        /**
         * 2. Récupération de la ressource en question
         * On va ici utiliser une requête préparée car elle inclue une variable qui provient de l'utilisateur
         */
        $ressource = $this->model->find($ressource_id);

        /**
         * 3. On affiche 
         */
        // fonctions compact permet de créer un tableau associatif à partir du nom de variable qu'on met dedans. Les clés et les valeur ont le même contenu grâce à cette fonction. Ceux nom variables sont envoyés dans la fonction rendre et elles seront extraites sous en forme des véritables variables dans la fonction extract
        \Renderer::render('ressources/show', compact('ressource', 'ressource_id'));
    }

    // Nettoyage des chaînes vides et la sécurité contre les caractères spéciaux
    public function securityForm($formData)
    {
        $formData = trim($_POST[$formData]);
        $formData = stripslashes($formData);
        $formData = htmlspecialchars($formData);
        return $formData;
    }

    // Créer une ressource
    public function create()
    {
        $ressourceModel = new \Ressource();

        /**
         * 1. On vérifie que les données ont bien été envoyées en POST
         * D'abord, on récupère les informations à partir du POST
         * Ensuite, on vérifie qu'elles ne sont pas nulles
         */

        // Traitement de la form de modification
        // Si l'utilisateur clique sur le bouton le traitement est executé, sinon on n'a pas besoin de faire le traitement
        if (isset($_POST['Enregistrer'])) {         

            /**
             * 1. On vérifie que les données ont bien été envoyées en POST
             * D'abord, on récupère les informations à partir du POST
             * Ensuite, on vérifie qu'elles ne sont pas nulles
             */
            if (empty($_POST['TitreRessource']) || empty($_POST['LienServeur']) || empty($_POST['Categorie']) || empty($_POST['TypeRessource']) || empty($_POST['StatutRessource'])) {
                $this->message = "Veuillez remplir tous les champs !";
            }

            $newTitre = $this->securityForm('TitreRessource');
            $newLienServeur = $this->securityForm('LienServeur');
            $newCategorieId = $this->securityForm('Categorie');
            $newTypeId = $this->securityForm('TypeRessource');
            $newStatutId = $this->securityForm('StatutRessource');

            // 3. Soumission des données
            $this->model->createRessource($newTitre, $newLienServeur, $newCategorieId, $newTypeId, $newStatutId);

            // 4. Redirection vers la page d'accueil
            \Http::redirect("index.php");
        }
        /**
         * 3. Récupérer toutes les catégories afin de permettre à l'utilisateur de sélectionner une catégorie dans une liste déroulante
         */
        $allCategories = $this->model->findAllCategories();

        /**
         * 4. Récupérer tout les types afin de permettre à l'utilisateur de sélectionner un type dans une liste déroulante
         */
        $types = $this->model->findAllTypes();

        /**
         * 5. Récupérer tout les statuts afin de permettre à l'utilisateur de sélectionner un statut
         */
        $statuts = $this->model->findAllStatuts();

        // fonctions compact permet de créer un tableau associatif à partir du nom de variable qu'on met dedans. Les clés et les valeur ont le même contenu grâce à cette fonction. Ceux nom variables sont envoyés dans la fonction rendre et elles seront extraites sous en forme des véritables variables dans la fonction extract
        \Renderer::render('ressources/create', compact('allCategories', 'types', 'statuts'));
    }

    // Modifier une ressource
    public function modify()
    {
        // Récupération des datas de la page de modification

        /**
         * 1. Récupération du param "id"
         */
        $ressource_id = $_GET['id'];

        /**
         * 2. Récupération de la ressource en question
         * On va ici utiliser une requête préparée car elle inclue une variable qui provient de l'utilisateur
         */
        $ressource = $this->model->find($ressource_id);

        /**
         * 3. Récupérer toutes les catégories afin de permettre à l'utilisateur de sélectionner une catégorie dans une liste déroulante
         */
        $allCategories = $this->model->findAllCategories();

        /**
         * 4. Récupérer tout les types afin de permettre à l'utilisateur de sélectionner un type dans une liste déroulante
         */
        $types = $this->model->findAllTypes();

        /**
         * 5. Récupérer tout les statuts afin de permettre à l'utilisateur de sélectionner un statut
         */
        $statuts = $this->model->findAllStatuts();

        /**
         * 6. On affiche 
         */
        // fonctions compact permet de créer un tableau associatif à partir du nom de variable qu'on met dedans. Les clés et les valeur ont le même contenu grâce à cette fonction. Ceux nom variables sont envoyés dans la fonction rendre et elles seront extraites sous en forme des véritables variables dans la fonction extract
        \Renderer::render('ressources/modify', compact('ressource', 'ressource_id', 'allCategories', 'types', 'statuts'));

        // Traitement de la form de modification
        // Si l'utilisateur clique sur le bouton le traitement est executé, sinon on n'a pas besoin de faire le traitement
        if (isset($_POST['Enregistrer'])) {         

            /**
             * 1. On vérifie que les données ont bien été envoyées en POST
             * D'abord, on récupère les informations à partir du POST
             * Ensuite, on vérifie qu'elles ne sont pas nulles
             */
            if (empty($_POST['TitreRessource']) || empty($_POST['LienServeur']) || empty($_POST['Categorie']) || empty($_POST['TypeRessource']) || empty($_POST['StatutRessource'])) {
                $this->message = "Veuillez remplir tous les champs !";
            }

            $newTitre = $this->securityForm('TitreRessource');
            $newLienServeur = $this->securityForm('LienServeur');
            $newCategorieId = $this->securityForm('Categorie');
            $newTypeId = $this->securityForm('TypeRessource');
            $newStatutId = $this->securityForm('StatutRessource');

            // $ressource_id = null;
            // if (!empty($_POST['ressource_id'])) {
            //     $ressource_id = $_POST['ressource_id'];
            // }

            // 3. Soumission des modifications
            $this->model->modifyRessource($ressource_id, $newTitre, $newLienServeur, $newCategorieId, $newTypeId, $newStatutId);

            // 4. Redirection vers la page d'accueil
            \Http::redirect("index.php");
        }
    }

    // Supprimer une ressource
    public function delete()
    {
        /**
         * 1. On vérifie que le GET possède bien un paramètre "id" (delete.php?id=202) et que c'est bien un nombre
         */
        if (empty($_GET['id']) || !ctype_digit($_GET['id'])) {
            die("Vous n'avez pas précisé l'id de la ressource !");
        }

        $id = $_GET['id'];

        /**
         * 2. Vérification que la ressource existe
         */
        $ressource = $this->model->find($id);
        if (!$ressource) {
            die("La ressource $id n'existe pas, vous ne pouvez donc pas le supprimer !");
        }

        /**
         * 3. Réelle suppression de la ressource
         */
        $this->model->delete($id);

        /**
         * 4. Redirection vers la page d'accueil
         */
        \Http::redirect("index.php");
    }
}
