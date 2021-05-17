<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-wEmeIV1mKuiNpC+IOBjI7aAzPcEZeedi5yW5f2yOq55WWLwNGmvvx4Um1vskeMj0" crossorigin="anonymous">

<h1><?= $ressource['titre'] ?></h1>
<small>Ecrit le <?= $ressource['date_creation'] ?></small>
<p><?= $ressource['categorie'] ?></p>
<hr>
<?= $ressource['lien_serveur'] ?>
<hr>

<div class="card">
    <div class="card-body">
        <div class="row">
            <div class="col">
                <ul class="list-group list-group-horizontal">
                    <li class="list-group-item w-25"><small>Écrit par</small></li>
                    <li class="list-group-item w-75">Auteur</li>
                </ul>
                <ul class="list-group list-group-horizontal">
                    <li class="list-group-item w-25"><small>Écrit le</small></li>
                    <li class="list-group-item w-75"><?= $ressource['date_creation'] ?></li>
                </ul>
                <ul class="list-group list-group-horizontal">
                    <li class="list-group-item w-25"><small>Type ressource</small></li>
                    <li class="list-group-item w-75"><?= $ressource['typeRessource'] ?></li>
                </ul>
                <ul class="list-group list-group-horizontal">
                    <li class="list-group-item w-25"><small>Statut ressource</small></li>
                    <li class="list-group-item w-75"><?= $ressource['statutRessource'] ?></li>
                </ul>
            </div>
        </div>
    </div>
</div>
<!-- 
<!-- <?php if (count($commentaires) === 0) : ?>
    <h2>Il n'y a pas encore de commentaires pour cette ressource ... SOYEZ LE PREMIER ! :D</h2>
<?php else : ?>
    <h2>Il y a déjà <?= count($commentaires) ?> réactions : </h2>
    <!-- <?php foreach ($commentaires as $commentaire) : ?>
        <h3>Commentaire de <?= $commentaire['author'] ?></h3>
        <small>Le <?= $commentaire['date_creation'] ?></small>
        <blockquote>
            <em><?= $commentaire['lien_serveur'] ?></em>
        </blockquote>
        <a href="delete-comment.php?id=<?= $commentaire['id'] ?>" onclick="return window.confirm(`Êtes vous sûr de vouloir supprimer ce commentaire ?!`)">Supprimer</a>
    <?php endforeach ?> -->
<?php endif ?> -->

<form action="save-ressource.php" method="POST">
    <h3>Vous voulez réagir ? N'hésitez pas les bros !</h3>
    <input type="text" name="auteur_id" placeholder="Votre auteur_id !">
    <textarea name="contenu" id="" cols="30" rows="10" placeholder="Votre commentaire ..."></textarea>
    <input type="hidden" name="ressource_id" value="<?= $ressource_id ?>">
    <button>Commenter !</button>
</form> -->