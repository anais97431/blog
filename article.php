<?php
include "conect.php";
include "upload.php";
include "fonction.php";
include "header.php";

// recup du GET id
@$id_article = $_GET["id"];
// recup de la fonction article_unique
$article_uni = article_unique($id_article);

// recup des post
@$ajouter = $_POST["ajouter"];
@$commentaire = $_POST["commentaire"];

// $_SESSION["nom"];
// $_SESSION["prenom"];

//si clic sur ajouter on insert le commentaire
if ($ajouter) {
    insert_com($id_article, $commentaire);
}

// recup de la fonction liste_com
$recup_com = liste_com($id_article);
?>

<!-- affichage des valeurs avec un echo et protection de la valeur qui arrive-->
<div class="container">
    <h1 id="h1"><?php echo stripslashes($article_uni->titre_article); ?></h1>
    <img src="upload/<?php echo @$article_uni->img; ?>" alt="">
    <p><?php echo stripslashes($article_uni->article); ?></p>


    <p><?php echo $article_uni->nom; ?><?php echo $article_uni->prenom; ?></p>
    <hr>

    <?php if ($article_uni->commentaire) { ?>

    <form action="article.php?id=<?php echo $id_article; ?>" method="post">
        <label for="com">Ajouter votre commentaire.</label>
        <textarea name="commentaire" class="form-control" maxlenght="300" id="com" cols="30" rows="5"></textarea>

        <input type="submit" class="btn" name="ajouter" value="Ajouter">



    </form>

    <?php } ?>

    <?php foreach ($recup_com as $row) { ?>
    <div>
        <p><?php echo frdate($row->date_creat) ?></p>
        <p><?php echo $row->commentaire ?></p>
        <p><?php echo $row->auteur ?></p>
        <p><?php echo $row->auteur ?></p>
    </div>
    <?php } ?>




    <?php include "footer.php"; ?>

</div>