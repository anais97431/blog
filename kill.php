<?php
destroy();

function destroy()
{
    session_start();
    session_destroy();
    header('Location: login.php');
}