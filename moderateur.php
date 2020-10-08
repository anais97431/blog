<?php
include "conect.php";
include "fonction.php";
include "header_admin.php";

@$valider = $_POST["valider"];
@$id_commentaire = $_POST["commentaire"];
@$supprimer = $_POST["supprimer"];

if ($valider) {
    valid_com($id_commentaire);
}

if ($supprimer) {
    supprime_com($id_commentaire);
}

$liste_com = liste_com_complete();
//var_dump($liste_com)
?>


<div id="moderateur" class="container">
    <?php foreach ($liste_com as $row) { ?>
    <form action="moderateur.php" method="post">
        <div><?php echo $row->titre_article ?></div>
        <input type="hidden" name="commentaire" value="<?php echo $row->id_commentaire; ?>">
        <div><?php echo $row->id_article ?></div>
        <div><?php echo $row->com ?></div>
        <input type="submit" class="button" name="valider" value="Valider">
        <input type="submit" class="button" name="supprimer" value="Supprimer">
        <hr>
    </form>
    <?php } ?>
</div>