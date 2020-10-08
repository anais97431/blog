<?php
include "conect.php";
include "fonction.php";

include "header.php";



if ($_POST) {

    @$recherche = htmlspecialchars($_POST["recherche"]);
}



$result = recherche($recherche);

//var_dump($result);

?>


<div class="row">
    <?php if (!empty($result)) { ?>
    <div class="search">
        <?php foreach (@$result as $row) { ?>

        <div class="col-md-6">

            <h2 class="titre"><?php echo $row->titre_article ?></h2>
            <h5 class="nom_cat"><?php echo $row->nom_cat ?></h5>
            <div class="imgArticle">

                <p class="article_court"><?php echo $row->article_court ?>...<a
                        href="article.php?id=<?php echo $row->id_article; ?>&nom_cat=<?php echo $row->nom_cat ?>">Suite</a>
                </p>

            </div>
        </div>
        <?php } ?>
    </div>
    <?php } else { ?>
    <h3> Pas de réponse pour votre recherche </h3>
    <?php } ?>
</div>

<?php include "footer.php" ?>

<script>
$(document).ready(function() {
    $(".search").mark("<?php echo @$recherche; ?>");

});
</script>