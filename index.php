<?php
include "conect.php";
include "fonction.php";

include "header.php";

$recup_des_articles = recup_des_articles();

// var_dump($recup_des_articles);
?>





<div id="index" class="row">

    <?php foreach ($recup_des_articles as $row) { ?> <div class="col-md-6">
        <h2 class="titre"><?php echo $row->titre_article ?></h2>
        <h5 class="nom_cat"><?php echo $row->nom_cat ?></h5>
        <div class="imgArticle">
            <img class="imgIndex" src="upload/<?php echo $row->img; ?>" alt="">
            <p class="article_court"><?php echo $row->article_court ?>...<a
                    href="article.php?id=<?php echo $row->id_article; ?>&nom_cat=<?php echo $row->nom_cat ?>">Suite</a>
            </p>


            <p class="nom"><?php echo $row->nom ?> <?php echo $row->prenom ?></p>
        </div>
    </div>
    <?php } ?>
</div>

<?php include "footer.php" ?>