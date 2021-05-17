<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-wEmeIV1mKuiNpC+IOBjI7aAzPcEZeedi5yW5f2yOq55WWLwNGmvvx4Um1vskeMj0" crossorigin="anonymous">


<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
    <div class="container-fluid">
        <a class="navbar-brand" href="#">Navbar</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavAltMarkup" aria-controls="navbarNavAltMarkup" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNavAltMarkup">
            <div class="navbar-nav">
                <a class="nav-link active" aria-current="page" href="#">Home</a>
                <a class="nav-link" href="#">Features</a>
                <a class="nav-link" href="#">Pricing</a>
                <a class="nav-link disabled" href="#" tabindex="-1" aria-disabled="true">Disabled</a>
            </div>
        </div>
    </div>
</nav>


<nav aria-label="breadcrumb">
    <ol class="breadcrumb">
        <li class="breadcrumb-item"><a href="#">Home</a></li>
        <li class="breadcrumb-item"><a href="#">Library</a></li>
        <li class="breadcrumb-item active" aria-current="page">Data</li>
    </ol>
</nav>

<?php foreach ($ressources as $ressource) : ?>


    <div class="container-fluid">
        <div class="row">
            <div class="col">
                <h1>Nos ressources</h1>

                <div class="card">
                    <div class="card-body">
                        <div class="row">
                            <div class="col-9">
                                <h2 class="card-title"><?= $ressource['titre'] ?></h2>
                                <h5 class="card-subtitle mb-2 text-muted">Catégorie : <span class="badge bg-secondary"><?= $ressource['categorie'] ?></span></h5>
                                <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                                <a href="ressource.php?id=<?= $ressource['id'] ?>" class="btn btn-outline-primary">Lire la suite</a>
                                <a href="delete-ressource.php?id=<?= $ressource['id'] ?>" class="btn btn-outline-danger" onclick="return window.confirm(`Êtes vous sur de vouloir supprimer cette ressource ?!`)">Supprimer</a>
                            </div>
                            <div class="col-3">
                                <ul class="list-group list-group-horizontal">
                                    <li class="list-group-item w-50"><small>Écrit par</small></li>
                                    <li class="list-group-item w-50">Auteur</li>
                                </ul>
                                <ul class="list-group list-group-horizontal">
                                    <li class="list-group-item w-50"><small>Écrit le</small></li>
                                    <li class="list-group-item w-50"><?= $ressource['date_creation'] ?></li>
                                </ul>
                                <ul class="list-group list-group-horizontal">
                                    <li class="list-group-item w-50"><small>Type ressource</small></li>
                                    <li class="list-group-item w-50">A third item</li>
                                </ul>
                                <ul class="list-group list-group-horizontal">
                                    <li class="list-group-item w-50"><small>Statut ressource</small></li>
                                    <li class="list-group-item w-50">A third item</li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

<?php endforeach ?>

<!-- <?php foreach ($ressources as $ressource) : ?>
        <h2><?= $ressource['titre'] ?></h2>
        <small>Ecrit le <?= $ressource['date_creation'] ?></small>
        <h3>Catégorie : <?= $ressource['libelle'] ?></h3>
        <p><?= $ressource['categorie_id'] ?></p>
        <a href="ressource.php?id=<?= $ressource['id'] ?>">Lire la suite</a>
        <a href="delete-ressource.php?id=<?= $ressource['id'] ?>" onclick="return window.confirm(`Êtes vous sur de vouloir supprimer cette ressource ?!`)">Supprimer</a>
    <?php endforeach ?> -->