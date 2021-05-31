<?php

require_once('libraries/Database.php');

class Ressource
{
    public function __construct()
    {
        $this->pdo = \Database::getPdo();
    }

    // Retourne la liste des ressources classées par date de création
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

    /**
     * Retourne la ressource sélectionnée
     *
     * @param integer $id
     * 
     */
    public function find(int $id)
    {
        $query = $this->pdo->prepare("SELECT ressource.id, ressource.titre, ressource.lien_serveur, ressource.date_creation, 
        statut_ressource.libelle AS statutRessource, type_ressource.libelle AS typeRessource, categorie.libelle AS categorie, categorie.id AS categorie_id,
        utilisateur.prenom AS auteurPrenom, utilisateur.nom AS auteurNom
        FROM ressource 
        INNER JOIN categorie ON categorie.id = ressource.categorie_id 
        INNER JOIN utilisateur ON utilisateur.id = ressource.auteur_id 
        INNER JOIN statut_ressource ON statut_ressource.id = ressource.statut_ressource_id 
        INNER JOIN type_ressource ON type_ressource.id = ressource.type_ressource_id 
        WHERE ressource.id = :ressource_id");

        // On exécute la requête en précisant le paramètre :ressource_id 
        $query->execute(['ressource_id' => $id]);
        $ressource = $query->fetch();

        return $ressource;
    }

    //  Créer une ressource
    public function createRessource(string $newTitre, string $newLienServeur, string $newCategorieId, string $newTypeId, string $newStatutId)
    {
        $query = $this->pdo->prepare("INSERT INTO ressource 
        SET categorie_id = :categorie_id,
            accessibilite_id = 2,
            auteur_id = 3,
            statut_ressource_id = :statut_ressource_id,
            type_ressource_id = :type_ressource_id,
            titre = :titre,
            lien_serveur = :lien_serveur,
            date_creation = NOW()");

        $query->execute([
            'categorie_id' => $newCategorieId,
            'statut_ressource_id' => $newStatutId,
            'type_ressource_id' => $newTypeId,
            'titre' => $newTitre,
            'lien_serveur' => $newLienServeur
        ]);
    }

    //  Modifier la ressource sélectionnée
    public function modifyRessource(int $ressource_id, string $newTitre, string $newLienServeur, string $newCategorieId, string $newTypeId, string $newStatutId)
    {
        $query = $this->pdo->prepare("UPDATE ressource 
        SET titre = :titre,
            lien_serveur = :lien_serveur,
            categorie_id = :categorie_id,
            type_ressource_id = :type_ressource_id,
            statut_ressource_id = :statut_ressource_id
        WHERE ressource.id = :ressource_id");

        $query->execute([
            'ressource_id' => $ressource_id,
            'titre' => $newTitre,
            'lien_serveur' => $newLienServeur,
            'categorie_id' => $newCategorieId,
            'type_ressource_id' => $newTypeId,
            'statut_ressource_id' => $newStatutId
        ]);

        // v1 avec les sous requêtes
        // $query = $this->pdo->prepare("UPDATE ressource 
        // SET titre = :titre,
        //     lien_serveur = :lien_serveur,
        //     categorie_id = (SELECT id FROM categorie WHERE libelle = :categorie),
        //     type_ressource_id = (SELECT id FROM type_ressource WHERE libelle = :newType)
        //     statut_ressource_id = (SELECT id FROM statut_ressource WHERE libelle = :statut)
        // WHERE ressource.id = :ressource_id");
        // $ressources = $resultats->fetchAll();
        // return $ressources;

        // $query->bindParam(1, $ressource_id, \Database::getPdo()::PARAM_INT);
        // $query->bindParam(2, $newTitre, \Database::getPdo()::PARAM_STR);

        // $query->bindValue(1, $ressource_id, \Database::getPdo()::PARAM_INT);
        // $query->bindValue(2, $newTitre, \Database::getPdo()::PARAM_STR);
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
        $statuts = $resultats->fetchAll();

        return $statuts;
    }
}
