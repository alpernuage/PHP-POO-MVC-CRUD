<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-wEmeIV1mKuiNpC+IOBjI7aAzPcEZeedi5yW5f2yOq55WWLwNGmvvx4Um1vskeMj0" crossorigin="anonymous">

<div class="container-fluid">
    <div class="row">
        <div class="col">

            <div class="card">
                <div class="card-body">
                    <div class="row">
                        <div class="col">
                            <form method="POST" action="#">
                                <div class="row">
                                    <div class="col mb-2">
                                        <h1>Créer une ressource</h1>
                                    </div>
                                </div>
                                <div class="form-row">
                                    <div class="form-group col-md-6">
                                        <label for="titreRessource">Titre de ressource</label>
                                        <input type="text" class="form-control" name="titreRessource">
                                    </div>
                                    <!-- <div class="form-group col-md-6">
                                        <label for="Auteur">Écrit par</label>
                                        <input type="text" class="form-control" name="Auteur" >
                                    </div> -->
                                </div>
                                <div class="form-group col-md-6">
                                    <label for="lienServeur">Contenue de ressource (lien serveur)</label>
                                    <input type="text" class="form-control" name="lienServeur">
                                </div>
                                <div class="form-row">
                                    <div class="form-group col-md-4">
                                        <label for="categorie">Catégorie </label>
                                        <select name="categorie" class="form-control">
                                            <?php foreach ($allCategories as $oneCategorie) : ?>
                                                <option value="<?= $oneCategorie['id'] ?>"><?= $oneCategorie['libelle'] ?></option>
                                            <?php endforeach ?>
                                        </select>
                                        <label for="typeRessource">Type ressource</label>
                                        <select name="typeRessource" class="form-control">
                                            <?php foreach ($types as $type) : ?>
                                                <option><?= $type['libelle'] ?></option>
                                            <?php endforeach ?>
                                        </select>
                                        <!-- <fieldset class="form-group my-3">
                                            <div class="row">
                                                <legend class="col-form-label col-sm-2 pt-0">Statut ressource</legend>
                                                <div class="col-sm-10">
                                                    <?php foreach ($statuts as $statut) : ?>
                                                        <div class="form-check">
                                                            <input class="form-check-input" type="radio" value="<?= $statut['id'] ?>" name="statutRessource">
                                                            <label class="form-check-label">
                                                                <?= $statut['libelle'] ?>
                                                            </label>
                                                        </div>
                                                    <?php endforeach ?>
                                                </div>
                                            </div>
                                        </fieldset> -->
                                    </div>
                                </div>
                                <button type="submit" name="Enregistrer" class="btn btn-outline-primary">Enregistrer</button>
                            </form>
                        </div>
                    </div>
                </div>
                <!-- end Card body -->

            </div>
            <!-- end Card -->
        </div>
    </div>
</div>