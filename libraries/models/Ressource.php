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
     * Créer une ressource
     * 
     * @param integer $ressource_id
     * @return void
     */
    public function createRessource(string $newTitre, string $newLien_serveur, string $newCategorieId, string $newTypeId)
    {
        // Insère une ressource dans la base de données
        $query = $this->pdo->prepare("INSERT INTO ressource 
        SET titre = :titre,
            -- auteur = :auteur,
            date_creation = NOW(),
            lien_serveur = :lien_serveur,
            categorie_id = :categorie_id,
            type_ressource_id = :type_ressource_id
            -- statut_ressource_id = :statut_id
        ");

        $query->execute([
            'titre' => $newTitre,
            // 'auteur' => $newAuteur,
            'lien_serveur' => $newLien_serveur,
            'categorie_id' => $newCategorieId,
            'type_ressource_id' => $newTypeId
            // 'statut_ressource_id' => $newStatutId
        ]);
    }

    /**
     * Modifier la ressource sélectionnée
     * 
     * @param integer $ressource_id
     * @return void
     */
    // public function modifyRessource($ressource_id, string $newTitre, string $newLien_serveur, string $newCategorie, string $newType, string $newStatut)
    // {
    //     $resultats = $this->pdo->query("UPDATE ressource 
    //     SET titre = $newTitre,
    //         lien_serveur = $newLien_serveur,
    //         categorie_id = (SELECT id FROM categorie WHERE libelle = $newCategorie),
    //         type_ressource_id = (SELECT id FROM type_ressource WHERE libelle = $newType),
    //         statut_ressource_id = (SELECT id FROM statut_ressource WHERE libelle = $newStatut)
    //     WHERE ressource.id = $ressource_id");

    //     // On fouille le résultat pour en extraire les données réelles de la ressource
    //     $ressources = $resultats->fetchAll();

    //     return $ressources;
    // }


    // Function v2
    // public function modifyRessource($ressource_id, $newTitre, $newLien_serveur, $newCategorieId, $newTypeId, $newStatutId)
    // {
    //     $query = $this->pdo->prepare("UPDATE ressource 
    //     SET titre = :titre,
    //         lien_serveur = :lien_serveur,
    //         categorie_id = :categorie_id,
    //         type_ressource_id = :type_ressource_id,
    //         statut_ressource_id = :statut_id
    //     WHERE ressource.id = :ressource_id");

    public function modifyRessource($ressource_id, $newTitre)
    {
        $query = $this->pdo->prepare("UPDATE ressource 
        SET titre = :titre,
        WHERE ressource.id = :ressource_id");

        // v1 de la requête
        // $query = $this->pdo->prepare("UPDATE ressource 
        // SET titre = :titre,
        //     lien_serveur = :lien_serveur,
        //     categorie_id = (SELECT id FROM categorie WHERE libelle = :categorie),
        //     type_ressource_id = (SELECT id FROM type_ressource WHERE libelle = :type)
        //     statut_ressource_id = (SELECT id FROM statut_ressource WHERE libelle = :statut)
        // WHERE ressource.id = :ressource_id");

        // On fouille le résultat pour en extraire les données réelles de la ressource
        // $query->execute([
        //     'ressource_id' => $ressource_id,
        //     'titre' => $newTitre,
        //     'lien_serveur' => $newLien_serveur,
        //     'categorie_id' => $newCategorieId,
        //     'type_ressource_id' => $newTypeId,
        //     'statut_ressource_id' => $newStatutId
        // ]);

        $query->execute([
            'ressource_id' => $ressource_id,
            'titre'        => $newTitre
        ]);
    }

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
