<?php

@$menu = $_GET["menu"];
switch ($menu) {
    case 1:
        $active_1 = " active";
        break;
    case 2:
        $active_2 = " active";
        break;
    default;
}

//pour que les css ne passe pas en memoire
$unique = uniqid();
?>





<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <!-- bootstrap -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">

    <!-- jodit -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jodit/3.2.65/jodit.min.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jodit/3.2.65/jodit.min.js"></script>
    <link href="https://fonts.googleapis.com/css?family=Aclonica|Rochester|Parisienne&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="css/style.css?un=<?php echo $unique; ?>">

    <title>Document</title>
</head>

<body>

    <nav class="navbar navbar-expand-lg navbar-light bg-light fixed-top">
        <a class="navbar-brand" href="#">BackOffice</a>
        <img src="image/logo.png" width="60" height="60" alt="logo">
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavAltMarkup"
            aria-controls="navbarNavAltMarkup" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNavAltMarkup">
            <div class="navbar-nav">
                <a class="nav-item nav-link <?php echo @$active_1 ?>" href="admin.php?menu=1">Admin <span
                        class="sr-only">(current)</span></a>
                <a class="nav-item nav-link <?php echo @$active_2 ?>" href="moderateur.php?menu=2">Moderateur <span
                        class="sr-only">(current)</span></a>
            </div>
        </div>
    </nav>
    <br><br><br>
    <!-- debut du container -->
    <div class="container">