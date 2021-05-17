<?php

namespace Models;

require_once('libraries/models/Model.php');
require_once('libraries/models/Categorie.php');

class Ressource extends Model
{
    private $id;
    private $categorie_id;
    private $auteur_id;
    private $type_ressource;
    private $titre;
    private $lien_serveur;
    private $date_creation;

    /**
     * Retourne la liste des ressources classées par date de création
     *
     * @return array
     */
    public function findAll(): array
    {
        $resultats = $this->pdo->query('SELECT * FROM ressource ORDER BY date_creation DESC');
        // On fouille le résultat pour en extraire les données réelles
        $ressources = $resultats->fetchAll();

        return $ressources;
    }

    /**
     * Retourne la liste des ressources classées par date de création
     *
     * @param integer $id
     * @return void
     */
    public function find(int $id)
    {
        $query = $this->pdo->prepare("SELECT * FROM ressource WHERE id = :ressource_id");

        // On exécute la requête en précisant le paramètre :ressource_id 
        $query->execute(['ressource_id' => $id]);

        // On fouille le résultat pour en extraire les données réelles de la ressource
        $ressource = $query->fetch();

        return $ressource;
    }

    /**
     * Retourne la liste des ressources classées par date de création
     *
     * @param integer $id
     * @return void
     */
    // public function findCategory(int $id)
    // {
    //     $query = $this->pdo->prepare("SELECT ressource, categorie.libelle FROM categorie INNER JOIN ressource ON categorie.id = ressource.categorie_id WHERE id = :ressource_id");

    //     // On exécute la requête en précisant le paramètre :ressource_id 
    //     $query->execute(['ressource_id' => $id]);

    //     // On fouille le résultat pour en extraire les données réelles de la ressource
    //     $categorie = $query->fetch();

    //     return $categorie;
    // }

    // /**
    //  * Retourne la liste des ressources classées par date de création
    //  *
    //  * @param integer $id
    //  * @return void
    //  */
    // public function findCategory(Ressource $ressource)
    // {
    //     $query = $this->pdo->prepare("SELECT * FROM ressource INNER JOIN categorie ON ressource.id = categorie.id WHERE ressource.id = id");

    //     // On exécute la requête en précisant le paramètre :ressource_id 
    //     $query->execute(['id' => 'ressource_id']);

    //     // On fouille le résultat pour en extraire les données réelles de la ressource
    //     $ressource = $query->fetch();

    //     return $ressource;
    // }

    // public function insert() {
    //     //Insère une ressource

    //     $articleModel = new \Models\Article();

    //     /**
    //      * 1. On vérifie que les données ont bien été envoyées en POST
    //      * D'abord, on récupère les informations à partir du POST
    //      * Ensuite, on vérifie qu'elles ne sont pas nulles
    //      */
    //     // On commence par l'author
    //     $author = null;
    //     if (!empty($_POST['author'])) {
    //         $author = $_POST['author'];
    //     }

    //     // Ensuite le contenu
    //     $content = null;
    //     if (!empty($_POST['content'])) {
    //         // On fait quand même gaffe à ce que le gars n'essaye pas des balises cheloues dans sa ressource
    //         $content = htmlspecialchars($_POST['content']);
    //     }

    //     // Enfin l'id de l'article
    //     $article_id = null;
    //     if (!empty($_POST['article_id']) && ctype_digit($_POST['article_id'])) {
    //         $article_id = $_POST['article_id'];
    //     }

    //     // Vérification finale des infos envoyées dans le formulaire (donc dans le POST)
    //     // Si il n'y a pas d'auteur OU qu'il n'y a pas de contenu OU qu'il n'y a pas d'identifiant d'article
    //     if (!$author || !$article_id || !$content) {
    //         die("Votre formulaire a été mal rempli !");
    //     }

    //     $article = $articleModel->find($article_id);

    //     // Si rien n'est revenu, on fait une erreur
    //     if (!$article_id) {
    //         die("Ho ! L'article $article_id n'existe pas boloss !");
    //     }

    //     // 3. Insertion de la ressource
    //     $this->model->insert($author, $content, $article_id);

    //     // 4. Redirection vers l'article en question :
    //     \Http::redirect("index.php?controller=article&task=show&id=" . $article_id);
    // }

    /**
     * Supprime un article dans la BDD grâce à son identifiant
     *
     * @param integer $id
     * @return void
     */
    public function delete(int $id): void
    {
        $query = $this->pdo->prepare('DELETE FROM ressource WHERE id = :id');
        $query->execute(['id' => $id]);
    }
}
