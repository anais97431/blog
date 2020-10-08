<?php
include "conect.php";
include "upload.php";
include "fonction.php";

include "header_admin.php";


if ($_SESSION["niv"] != 1) {
    header('Location: login.php');
}

// var_dump($_POST);


$liste_cat = liste_cat();


// var_dump($liste_titre);



if ($_POST) {

    // var_dump($_POST);

    // recup des post
    // il faut proteger les posts

    @$modifier = htmlspecialchars($_POST["modifier"]);
    $id_article = htmlspecialchars($_POST["id_article"]);
    $id_categorie = htmlspecialchars($_POST["id_categorie"]);
    $titre_article = htmlspecialchars($_POST["titre_article"]);
    $id_user = htmlspecialchars($_POST["id_user"]);
    $article =  $_POST["article"];
    $article_court =  $_POST["article_court"];
    @$ajouter =  htmlspecialchars($_POST["ajouter"]);
    @$supprimer =  htmlspecialchars($_POST["supprimer"]);
    @$commentaire  =  $_POST["commentaire"];
    @$img  =  $_FILES;
    @$tags = htmlspecialchars($_POST["tags"]);


    //var_dump($img);

    // si on clic sur le bouton supprimer: permet l'appel de la fonction supprime_article pour supprimer un article 

    if ($supprimer) {
        supprime_article($id_article);
    }


    // si on clic sur le bouton modifier: permet l'appel de la fonction modif_article pour modifier un article et la fonction modif_tags pour modifier un tag
    // Protege l'entrée
    if ($modifier) {
        modif_article($id_article, $id_categorie, addslashes($titre_article), addslashes($article), addslashes($article_court), $commentaire);
        modif_tags($id_article, $tags);
    }

    // si on selectionne un article dans le select: permet l'appel de la fonction article_unique pour appeler un article 

    if ($id_article) {
        $article_unique =   article_unique($id_article);
        //var_dump($article_unique);
    }

    // Protege l'entrée d'un article
    //si on clic sur le bouton ajouter: permet l'appel de la fonction insert_article zt insert_tags pour ajouter dans la base un nouvel article et un nouveau tag
    if ($ajouter) {
        $id_article = insert_article(addslashes($titre_article), addslashes($article), $id_categorie, $id_user, addslashes($article_court), $commentaire);
        insert_tags($id_article, $tags);
    }
}
// permet de faire apparaite les titres des articles
$liste_titre =  liste_titre();

?>

<div class="container">

    <h1 class="page">PAGE ADMIN :<br> ENTRER UN ARTICLE</h1>
    <br>
    <!-- Formulaire permettant de selectionner les titre, les catégories et de creer de nouveaux articles -->
    <form class="form-admin" action="admin.php" method="post" id="target" enctype="multipart/form-data">
        <div class="form-group">
            <!-- LISTE DES TITRES -->
            <label class="formulaire" for="">Choix du titre*</label><br>
            <select name="id_article" id="id_article" onChange="submit()" class="form-control">
                <option value="">Choix du titre</option>
                <!-- Boucle permettant de recupérer dans le select le titre de l'article -->
                <?php foreach ($liste_titre as $row) { ?>
                <option value="<?php echo $row->id_article; ?>" <?php if ($row->id_article == @$_POST["id_article"]) {
                                                                        echo " selected";
                                                                    } ?>>
                    <?php echo stripslashes($row->titre_article); ?>
                </option>
                <?php } ?>

            </select>

        </div>
        <div class="form-group">
            <!-- LISTE CATEGORIES -->
            <label class="formulaire" for="">Choix des categories*</label><br>
            <select name="id_categorie" id="id_categorie" class="form-control" required>
                <option value="">Choix de votre catégorie</option>
                <?php foreach ($liste_cat as $row) { ?>

                <option value="<?php echo $row->id_categorie; ?>" <?php if ($row->id_categorie == @$article_unique->id_categorie) {
                                                                            echo " selected";
                                                                        } ?>><?php echo $row->nom_cat; ?></option>

                <?php } ?>
            </select>

        </div>
        <!--Titre article: le echo permet de recupérer la valeur qui est dans le base de donnée -->
        <div class="form-group">
            <label class="formulaire" for="">Titre de l'article*</label><br>
            <input type="text" value="<?php echo stripslashes(@$article_unique->titre_article); ?>" name="titre_article"
                class="form-control" required>
        </div>
        <!-- Article court le echo permet de recupérer la valeur qui est dans le base de donnée-->
        <div class="form-group">
            <label class="formulaire" for="">Article court*</label><br>
            <textarea name="article_court" maxlength="300" id="" class="form-control" cols="30"
                rows="5"><?php echo stripslashes(@$article_unique->article_court); ?></textarea>
        </div>
        <!-- Article le echo permet de recupérer la valeur qui est dans le base de donnée-->
        <div class="form-group">
            <label class="formulaire" for="">Article*</label><br>
            <textarea name="article" id="editor" class="form-control" cols="30"
                rows="10"><?php echo stripslashes(@$article_unique->article); ?></textarea><br>


            <?php // echo @$article_unique->commentaire; 
            ?>
        </div>
        <?php
        // si commentaire egale a rien ou si commentaire egale à 1 le oui est cocher sinon c'est la valeur non. 
        if (@$article_unique->commentaire == "" || @$article_unique->commentaire == 1) {
            $checked1 = " checked ";
        } else {
            $checked2 = " checked ";
        }

        ?>

        <!--le resultat du if au dessus est afficher par un echo dans les input oui et non-->
        <label class="formulaire" for="">Commentaire*</label><br>
        <div class="form-check form-check-inline">
            <input class="form-check-input" type="radio" <?php echo @$checked1 ?> name="commentaire" id="inlineRadio1"
                value="1">
            <label class="form-check-label" for="inlineRadio1">Oui</label>
        </div>

        <div class="form-check form-check-inline">
            <input class="form-check-input" type="radio" <?php echo @$checked2 ?> name="commentaire" id="inlineRadio2"
                value="0">
            <label class="form-check-label" for="inlineRadio2">Non</label>
        </div>
        <br>
        <br>

        <!-- TAGS: le echo permet d'afficher les tags a la selection du titre de l'article-->
        <label for="">Tags séparer par une virgule</label><br>
        <input type="text" value="<?php echo @$article_unique->noms_tag; ?>" class="form-control" name="tags">

        <!--Permet d'afficher id_user qui est connecté (cacher avec le type hidden)-->
        <input type="hidden" name="id_user" class="form-control" value="<?php echo @$_SESSION["id_user"]; ?>"
            required><br>


        <!-- IMAGE: permet de charger une image, le echo permet d'afficher l'image déjà présente dans l'article-->
        <input type="file" name="image"><br><br>
        <div>
            <img width=100 src="upload/<?php echo @$article_unique->img; ?>" alt=""><br>
            <?php echo @$article_unique->img; ?><br><br><br>
        </div>
        <!-- si id_article est vrai on affiche les boutons modifier et supprimer sinon on affiche le bouton ajouter-->
        <?php if (@$id_article) { ?>


        <input type="submit" class="btn btn-warning" name="modifier" value="Modifier">


        <input type="submit" id="supprimer" class="btn btn-danger" name="supprimer" value="Supprimer">
        <?php } else { ?>
        <input type="submit" class="btn btn-info" name="ajouter" value="Ajouter">
        <?php } ?>





    </form>
</div>
<!-- Script JODIT pour l'editeur de texte-->
<script>
var getUrl = window.location;
var baseUrl = getUrl.protocol + "//" + getUrl.host + "/" + getUrl.pathname.split('/')[1];




var editor = new Jodit('#editor', {
    uploader: {
        url: baseUrl + '/connector/index.php?action=fileUpload'
    },

    filebrowser: {
        ajax: {
            url: baseUrl + '/connector/index.php'
        }
    },
    "buttons": "|,source,bold,strikethrough,underline,italic,|,ul,ol,|,outdent,indent,|,font,fontsize,brush,paragraph,|,video, image,table,link,|,align,undo,redo,\n,hr,eraser,copyformat,|,symbol"

    //"buttons": "|,source,bold,strikethrough,underline,italic,|,superscript,subscript,|,ul,ol,|,outdent,indent,|,font,fontsize,brush,paragraph,|,image,file,video,table,link,|,align,undo,redo,\n,cut,hr,eraser,copyformat,|,symbol,fullsize,selectall,print,about"               
});
</script>


<?php
include "footer.php";
?>

<!-- Script permettant l'affichage de la fenetre de confirmation si on clic sur le bouton supprimer-->
<script>
$(document).ready(function() {

    $("#supprimer").on("click", function(e) {


        if (confirm("voulez-vous vraiment supprimer ?")) {
            // Code à éxécuter si le l'utilisateur clique sur "OK"
            exit();
        } else {
            // Code à éxécuter si l'utilisateur clique sur "Annuler" 
            e.preventDefault();
            exit();

        }
    });

});
</script>