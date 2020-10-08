<?php

include "conect.php";
include "fonction.php";
include "header.php";

if (@$_POST) {
    $nom = htmlspecialchars($_POST["nom"]);
    $prenom = htmlspecialchars($_POST["prenom"]);
    $mail = htmlspecialchars($_POST["mail"]);
    $passe = htmlspecialchars($_POST["passe"]);
    $connexion = htmlspecialchars($_POST["creer"]);
    $niv = 5;
    //si il y a une connection on lance la fonction add_info
    if ($connexion) {
        add_info($nom, $prenom, $mail, $passe, $niv);
    }
}
var_dump($_POST);





?>
<div class="container">
    <h1>PAGE USER</h1>

    <form class="form-login" action="user.php" method="post">

        <label for="">Votre Nom</label><br>
        <input type="text" class="form-control" name="nom" value="" required><br>

        <label for="">Votre Prénom</label><br>
        <input type="text" class="form-control" name="prenom" value="" required><br>

        <label for="">Adresse Mail</label><br>
        <input type="text" class="form-control" name="mail" value="" required><br>

        <label for="">Votre Mot de passe</label><br>
        <input type="password" class="form-control" name="passe" value="" required><br><br>

        <label for="">Retapez votre Mot de passe</label><br>
        <input type="password" class="form-control" name="passe" value="" required><br><br>

        <input type="submit" class="btn btn-info" name="creer" value="Créer">


    </form>
    <a href="kill.php">Session</a>

</div>