<?php

namespace Models;

require_once('libraries/models/Model.php');
require_once('libraries/models/Categorie.php');

class Ressource extends Model
{
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
     * Retourne la ressource sélectionnée
     *
     * @param integer $id
     * @return void
     */
    public function find(int $id)
    {
        $query = $this->pdo->prepare("SELECT ressource.id, ressource.titre, ressource.lien_serveur, ressource.date_creation, 
        statut_ressource.libelle AS statutRessource, type_ressource.libelle AS typeRessource, categorie.libelle AS categorie, 
        utilisateur.prenom AS auteurPrenom, utilisateur.nom AS auteurNom
        FROM ressource 
        INNER JOIN categorie ON categorie.id = ressource.categorie_id 
        INNER JOIN utilisateur ON utilisateur.id = ressource.auteur_id 
        INNER JOIN statut_ressource ON statut_ressource.id = ressource.statut_ressource_id 
        INNER JOIN type_ressource ON type_ressource.id = ressource.type_ressource_id 
        WHERE ressource.id = :ressource_id");

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
    public function findRessourceDetails()
    {
        $resultats = $this->pdo->query("SELECT ressource.id, ressource.titre, ressource.lien_serveur, ressource.date_creation, 
        statut_ressource.libelle AS statutRessource, type_ressource.libelle AS typeRessource, categorie.libelle AS categorie, 
        utilisateur.prenom AS auteurPrenom, utilisateur.nom AS auteurNom
        FROM ressource 
        INNER JOIN categorie ON categorie.id = ressource.categorie_id 
        INNER JOIN utilisateur ON utilisateur.id = ressource.auteur_id 
        INNER JOIN statut_ressource ON statut_ressource.id = ressource.statut_ressource_id 
        INNER JOIN type_ressource ON type_ressource.id = ressource.type_ressource_id 
        ORDER BY date_creation DESC");

        // On fouille le résultat pour en extraire les données réelles de la ressource
        $ressources = $resultats->fetchAll();

        return $ressources;
    }


    //  /**
    //  * Insère un commentaire dans la base de données
    //  *
    //  * @param string $author
    //  * @param string $content
    //  * @param string $article_id
    //  * @return void
    //  */
    // public function insert(string $author, string $content, string $article_id): void {
    //     $query = $this->pdo->prepare('INSERT INTO comments SET author = :author, content = :content, article_id = :article_id, created_at = NOW()');
    //     $query->execute(compact('author', 'content', 'article_id'));
    // }


    /**
     * Modifie la ressource sélectionnée
     * 
     * @param integer $id
     * @return void
     */
    public function modifyRessource($ressource_id, string $newTitre, string $newLien_serveur, string $newCategorie, string $newType, string $newStatut)
    {
        $resultats = $this->pdo->query("UPDATE ressource 
        SET titre = $newTitre,
            lien_serveur = $newLien_serveur,
            categorie_id = (SELECT id FROM categorie WHERE libelle = $newCategorie),
            type_ressource_id = (SELECT id FROM type_ressource WHERE libelle = $newType),
            statut_ressource_id = (SELECT id FROM statut_ressource WHERE libelle = $newStatut)
        WHERE ressource.id = $ressource_id");

        // On fouille le résultat pour en extraire les données réelles de la ressource
        $ressources = $resultats->fetchAll();

        return $ressources;
    }
    
    
    // Function v2
    // public function modifyRessource($ressource_id, string $newTitre, string $newLien_serveur, string $newCategorie, string $newType, string $newStatut)
    // {
    //     $query = $this->pdo->prepare("UPDATE ressource 
    //     SET titre = :newTitre,
    //         lien_serveur = :newLien_serveur,
    //         categorie_id = (SELECT id FROM categorie WHERE libelle = :newCategorie),
    //         type_ressource_id = (SELECT id FROM type_ressource WHERE libelle = :newType)
    //         statut_ressource_id = (SELECT id FROM statut_ressource WHERE libelle = :newStatut)
    //     WHERE ressource.id = :ressource_id");

    //     // On fouille le résultat pour en extraire les données réelles de la ressource
    //     $query->execute([
    //         'ressource_id' => $ressource_id,
    //         ':titre' => $newTitre,
    //         ':lien_serveur' => $newLien_serveur,
    //         ':categorie_id' => $newCategorie,
    //         ':type_ressource_id' => $newType,
    //         ':statut_ressource_id' => $newStatut
    //     ]);
    //     $ressources = $query->fetchAll();

    //     return $ressources;
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

    /**
     * Retourne la liste des categories 
     *
     * @return array
     */
    public function findAllCategories(): array
    {
        $resultats = $this->pdo->query('SELECT * FROM categorie ORDER BY libelle DESC');
        // On fouille le résultat pour en extraire les données réelles
        $allCategories = $resultats->fetchAll();

        return $allCategories;
    }

    /**
     * Retourne la liste des types 
     *
     * @return array
     */
    public function findAllTypes(): array
    {
        $resultats = $this->pdo->query('SELECT * FROM type_ressource ORDER BY libelle DESC');
        // On fouille le résultat pour en extraire les données réelles
        $types = $resultats->fetchAll();

        return $types;
    }

    /**
     * Retourne la liste des statuts 
     *
     * @return array
     */
    public function findAllStatuts(): array
    {
        $resultats = $this->pdo->query('SELECT * FROM statut_ressource ORDER BY libelle DESC');
        // On fouille le résultat pour en extraire les données réelles
        $statuts = $resultats->fetchAll();

        return $statuts;
    }
}
