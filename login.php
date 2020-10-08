<?php
include "conect.php";
include "fonction.php";
include "header.php";

if ($_POST) {
    $login = $_POST["login"];
    $passe = $_POST["passe"];
    verif_login($login, $passe);
}




?>


<div class="container">
    <h1 class="login">LOGIN</h1>

    <form class="form-login" action="login.php" method="post">

        <label for="">Votre Mail</label><br>
        <input type="text" class="form-control" name="login" value="smtjv@laposte.net" required><br>
        <label for="">Votre Password</label><br>
        <input type="password" class="form-control" name="passe" value="serge" required><br><br>
        <input type="submit" class="btn btn-info" name="verifier" value="verifier">
        <?php if (isset($_GET["message"])) { ?>
        <div>Vos identifiants ne sont pas valides</div>
        <?php } ?>
    </form>
    <a href="kill.php">Session</a>

</div>


<?php
include "footer.php";
?>