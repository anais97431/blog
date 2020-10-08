<?php
include "conect.php";
include "fonction.php";

$recup_des_articles = recup_des_articles();

// var_dump($recup_des_articles);
?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>blog</title>
</head>

<body>
    <?php foreach ($recup_des_articles as $row) { ?>
    <h2><?php echo $row->titre_article ?></h2>
    <p><?php echo $row->article ?></p>
    <p><?php echo $row->nom ?> <?php echo $row->prenom ?></p>
    <?php } ?>
</body>

</html>