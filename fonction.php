<?php
// demmarage des sessions
session_start();
/**
 * Verification des login pour verification du niv
 */


function verif_login($login, $passe)
{

    global  $connection;
    $sql = "SELECT * FROM users WHERE mail='$login' AND passe='$passe'";
    $sth = $connection->prepare($sql);
    $sth->execute();

    $resultat = $sth->fetch(PDO::FETCH_OBJ);
    // si le resultat est faux (mot de pass incorrect) on redirige vers la page login.php
    if (!$resultat) {
        header('Location: login.php?message=true');
        exit();
    }
    // redirection sur les pages 
    if ($resultat->niv == 1) {

        $_SESSION["id_user"] = $resultat->id_user;
        $_SESSION["niv"] = $resultat->niv;
        $_SESSION["nom"] = $resultat->nom;
        $_SESSION["prenom"] = $resultat->prenom;

        header('Location: admin.php');
        exit();
    } else {

        $_SESSION["id_user"] = $resultat->id_user;
        $_SESSION["niv"] = $resultat->niv;
        $_SESSION["nom"] = $resultat->nom;
        $_SESSION["prenom"] = $resultat->prenom;

        header('Location: index.php');
        exit();
    }
}

/**
 * Recuperation des postes et de la session $id_user
 */
function insert_article($titre_article, $article, $id_categorie, $id_user, $article_court, $commentaire)
{
    // recup de la connection
    global $connection;
    // insert dans la table articles
    $sql_ins = "INSERT INTO articles(titre_article,article, article_court,commentaire) VALUES (:titre_article, :article, :article_court,:commentaire)";

    $sth = $connection->prepare($sql_ins);
    $sth->execute(array(
        ':titre_article' => $titre_article,
        ':article' => $article,
        ':article_court' => $article_court,
        ':commentaire' => $commentaire


    ));
    // recuperation de id_article
    $id_article = $connection->lastInsertId();

    $id_user = $_SESSION["id_user"];
    // appel la function pour passer les id
    insert_liaison($id_article, $id_categorie, $id_user);

    $filename = img_load($id_article);

    $sql =  "UPDATE articles
    SET img = '$filename'
    WHERE id_article=$id_article";
    $sth = $connection->prepare($sql);
    $sth->execute();

    return $id_article;
}

/**
 * recuperation des id 
 */
function insert_liaison($id_article, $id_categorie, $id_user)
{
    // recup de la connection
    global $connection;

    $sql_ins = "INSERT INTO  liaisons(id_article, id_user, id_categorie) VALUES (:id_article, :id_user, :id_categorie)";

    $sth = $connection->prepare($sql_ins);
    $sth->execute(array(
        ':id_article' => $id_article,
        ':id_user' => $id_user,
        ':id_categorie' => $id_categorie

    ));
}

/**
 * liste des categories
 */
// 
function liste_cat()
{
    global  $connection;
    $sql = "SELECT * FROM categories";
    $sth = $connection->prepare($sql);
    $sth->execute();

    $resultat = $sth->fetchAll(PDO::FETCH_OBJ);

    return $resultat;
}

/**
 * recuperation des articles sur la base liaisons
 */

function recup_des_articles()
{
    global  $connection;

    $sql =  "SELECT *  FROM liaisons
    INNER JOIN users ON users.id_user = liaisons.id_user
    INNER JOIN articles ON articles.id_article = liaisons.id_article
    INNER JOIN categories ON categories.id_categorie = liaisons.id_categorie
    WHERE articles.actif=1";

    $sth = $connection->prepare($sql);
    $sth->execute();

    $resultat = $sth->fetchAll(PDO::FETCH_OBJ);
    return $resultat;
}


// recup liste titres actif
function liste_titre()
{
    global  $connection;
    // req ordonnée pas titre_article
    $sql = "SELECT id_article, titre_article FROM articles 
    WHERE actif=1
    ORDER BY titre_article ASC";
    $sth = $connection->prepare($sql);
    $sth->execute();

    $resultat = $sth->fetchAll(PDO::FETCH_OBJ);

    return $resultat;
}

// recup un article demandé par id_article
function article_unique($id_article)
{

    global  $connection;

    $sql =  "SELECT *  FROM liaisons
    INNER JOIN articles ON articles.id_article = liaisons.id_article
    INNER JOIN users ON users.id_user = liaisons.id_user
    INNER JOIN categories ON categories.id_categorie = liaisons.id_categorie
    LEFT JOIN tags ON articles.id_article = tags.id_article
    WHERE liaisons.id_article =$id_article";



    $sth = $connection->prepare($sql);
    $sth->execute();

    $resultat = $sth->fetch(PDO::FETCH_OBJ);
    return $resultat;
}


function modif_article($id_article, $id_categorie, $titre_article, $article, $article_court, $commentaire)
{
    global  $connection;
    // Modification de l'article
    $sql =  "UPDATE articles
    SET article = '$article', titre_article = '$titre_article',article_court='$article_court', commentaire=$commentaire
    WHERE id_article=$id_article";
    $sth = $connection->prepare($sql);
    $sth->execute();


    // modification de liaisons
    $sql =  "UPDATE liaisons
    SET id_categorie = '$id_categorie'
    WHERE id_article = $id_article";
    $sth = $connection->prepare($sql);
    $sth->execute();

    // selection de l'image pour comparaison
    $sql = "SELECT img FROM articles WHERE id_article=$id_article";
    $sth = $connection->prepare($sql);
    $sth->execute();

    $resultat = $sth->fetch(PDO::FETCH_OBJ);


    //detruire l'image si différente de la nouvelle image uploadée

    if ($_FILES["image"]["name"] != "") {






        if ($resultat->img != $_FILES["image"]["name"]) {

            @unlink("upload/" . $resultat->img);

            $filename = img_load($id_article);
        }
    }




    // récupération du nom de l'image;
    if (isset($filename)) {

        // update pour le nom de l'image;
        $sql =  "UPDATE articles
    SET img = '$filename'
    WHERE id_article=$id_article";
        $sth = $connection->prepare($sql);
        $sth->execute();
    }
}


function  supprime_article($id_article)
{
    global  $connection;

    $sql =  "UPDATE articles
    SET actif = 0
    WHERE id_article = $id_article";
    $sth = $connection->prepare($sql);
    $sth->execute();
    header('Location: admin.php');
}

function insert_com($id_article, $commentaire)
{
    global $connection;
    @$nom = $_SESSION["nom"];
    @$prenom = $_SESSION["prenom"];

    $sql_ins = "INSERT INTO  commentaires(id_article, commentaire, auteur) VALUES (:id_article, :commentaire, :auteur)";

    $sth = $connection->prepare($sql_ins);
    $sth->execute(array(
        ':id_article' => $id_article,
        ':commentaire' => $commentaire,
        ':auteur' => "$nom $prenom"

    ));
}

function liste_com($id_article)
{

    global  $connection;
    // req ordonnée pas titre_article
    $sql = "SELECT * FROM commentaires 
    WHERE id_article=$id_article AND valide=1 ORDER BY date_creat DESC";


    $sth = $connection->prepare($sql);
    $sth->execute();

    $resultat = $sth->fetchAll(PDO::FETCH_OBJ);

    return $resultat;
}


function liste_com_complete()
{
    global  $connection;

    $sql =  "SELECT *,commentaires.commentaire AS com  FROM commentaires
    INNER JOIN articles ON articles.id_article = commentaires.id_article
    WHERE commentaires.valide = 0 ORDER BY date_creat DESC";
    $sth = $connection->prepare($sql);
    $sth->execute();

    $resultat = $sth->fetchAll(PDO::FETCH_OBJ);
    return $resultat;
}
// fonction date qui permet de recuperer le timelaps de phpmyadmin et de le convertir en version francaise
function frdate($date1)
{
    setlocale(LC_TIME, "fr_FR.UTF-8");
    $date2  = strftime("%A %d %b %Y", strtotime($date1));
    return $date2;
}

function valid_com($id_commentaire)
{

    global  $connection;

    $sql =  "UPDATE commentaires
    SET valide = 1
    WHERE id_commentaire = $id_commentaire";
    $sth = $connection->prepare($sql);
    $sth->execute();
}

function supprime_com($id_commentaire)
{
    global  $connection;

    $sql =  "DELETE FROM commentaires
    WHERE id_commentaire = $id_commentaire";
    $sth = $connection->prepare($sql);
    $sth->execute();
}


// Vérification de la validité des informations


function add_info($nom, $prenom, $mail, $passe, $niv)
{

    global $connection;
    $sql = $connection->prepare("
     INSERT INTO users(nom,prenom,mail,passe,niv)
     VALUES (:nom,:prenom,:mail,:passe,:niv)


    ");
    $sql->execute(array(
        ':nom' => $nom,
        ':prenom' => $prenom,
        ':mail' => $mail,
        ':passe' => $passe,
        ':niv' => $niv
    ));
    echo "Entrée ajoutée dans la table";
}


function insert_tags($id_article, $tags)
{
    global $connection;
    // insert dans la table articles
    $sql_ins = "INSERT INTO tags(noms_tag,id_article) VALUES (:noms_tag,:id_article)";

    $sth = $connection->prepare($sql_ins);
    $sth->execute(array(
        ':noms_tag' => $tags,
        ':id_article' => $id_article
    ));
}

function modif_tags($id_article, $tags)
{
    global  $connection;
    $sql = "SELECT * FROM tags 
    WHERE id_article=$id_article";
    $sth = $connection->prepare($sql);
    $sth->execute();

    $resultat = $sth->fetch(PDO::FETCH_OBJ);

    if ($resultat) {
        // if resultat est vrai
        $sql =  "UPDATE tags
        SET noms_tag = '$tags'
        WHERE id_article = $id_article";
        $sth = $connection->prepare($sql);
        $sth->execute();
    } else {
        //if faux on insert un tag 
        insert_tags($id_article, $tags);
    }
}



function recherche($recherche)
{
    global  $connection;
    // req ordonnée pas titre_article

    $sql =  "SELECT *  FROM liaisons
    INNER JOIN articles ON articles.id_article = liaisons.id_article
    INNER JOIN categories ON categories.id_categorie = liaisons.id_categorie
    LEFT JOIN tags ON articles.id_article = tags.id_article
    WHERE articles.actif = 1 AND articles.article LIKE '%$recherche%' OR articles.actif = 1 AND articles.titre_article LIKE '%$recherche%' 
    OR articles.actif = 1 AND articles.article_court LIKE '%$recherche%' OR categories.nom_cat LIKE '%$recherche%' OR tags.noms_tag LIKE '%$recherche%'";

    $sth = $connection->prepare($sql);
    $sth->execute();

    $resultat = $sth->fetchAll(PDO::FETCH_OBJ);

    return $resultat;
}
//var_dump($resultat);



//====================== bouton envoyer ==============/


//  Récupération de l'utilisateur et de son pass hashé
//  function recup_user($id_user, $prenom)
// {

//     global $connection;
//     $sql = "SELECT * FROM users WHERE id_user = $id_user";
//     $sth = $connection->prepare($sql);
//     $sth->execute();

//     $resultat = $sth->fetch();

//     return $resultat;

//     // Comparaison du pass envoyé via le formulaire avec la base
//     $PasseCorrect = password_verify($_POST['passe'], $resultat['passe']);

//     if (!$resultat) {
//         echo 'Mauvais identifiant ou mot de passe !';
//     } else {
//         if ($PasseCorrect) {
//             session_start();
//             $_SESSION['id'] = $resultat['id'];
//             $_SESSION['prenom'] = $prenom;
//             echo 'Vous êtes connecté !';
//         } else {
//             echo 'Mauvais identifiant ou mot de passe !';
//         }
//     }
// }