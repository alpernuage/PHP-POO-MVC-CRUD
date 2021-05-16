<?php

namespace Models;

require_once('libraries/models/Model.php');
require_once('libraries/models/Ressource.php');

class Categorie extends Model
{
    /**
     * Retourne la liste des categories classées par libelle
     *
     * @return array
     */
    public function findAll(): array
    {
        $resultats = $this->pdo->query('SELECT categorie.libelle FROM categorie ORDER BY libelle DESC');
        // On fouille le résultat pour en extraire les données réelles
        $categories = $resultats->fetchAll();

        return $categories;
    }
         
    /**
     * Retourne la liste des categories classées par libelles
     *
     * @param integer $id
     * @return void
     */
    public function find(int $ressource_id)
    {
        $query = $this->pdo->prepare("SELECT * FROM categorie INNER JOIN ressource ON categorie.id = ressource.categorie_id WHERE categorie.id = :id");

        // On exécute la requête en précisant le paramètre :id 
        $query->execute(['id' => $ressource_id]);

        // On fouille le résultat pour en extraire les données réelles de la categorie
        $categorie = $query->fetch();
        
        var_dump($categorie); 
        die();

        return $categorie;
    }

    /**
     * Retourne la liste des commentaires d'un article donné
     *
     * @param integer $article_id
     * @return array
     */
    public function findAllWithArticle(int $article_id) :array {
        $query = $this->pdo->prepare("SELECT * FROM comments WHERE article_id = :article_id");
        $query->execute(['article_id' => $article_id]);
        $commentaires = $query->fetchAll();

        return $commentaires;
    }

}
