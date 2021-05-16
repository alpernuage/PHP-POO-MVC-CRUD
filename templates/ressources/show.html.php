<h1><?= $ressource['titre'] ?></h1>
<small>Ecrit le <?= $ressource['date_creation'] ?></small>
<p><?= $ressource['categorie_id'] ?></p>
<hr>
<?= $ressource['lien_serveur'] ?>
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